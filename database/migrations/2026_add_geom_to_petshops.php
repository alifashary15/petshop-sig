<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // 1. Aktifkan ekstensi PostGIS (jika belum)
        DB::statement('CREATE EXTENSION IF NOT EXISTS postgis');

        // 2. Tambah kolom geography POINT dengan SRID 4326
        //    geography lebih akurat untuk hitung jarak di permukaan bumi (meter)
        //    vs geometry yang flat/planar
        DB::statement('
            ALTER TABLE petshops
            ADD COLUMN IF NOT EXISTS geom geography(POINT, 4326)
        ');

        // 3. Isi kolom geom dari data latitude/longitude yang sudah ada
        //    ST_MakePoint(lon, lat) — perhatikan urutan: LONGITUDE dulu, baru LATITUDE
        DB::statement('
            UPDATE petshops
            SET geom = ST_MakePoint(longitude, latitude)::geography
            WHERE latitude IS NOT NULL AND longitude IS NOT NULL
        ');

        // 4. Buat Spatial Index GIST — mempercepat query ST_DWithin, ST_Distance, dll.
        DB::statement('
            CREATE INDEX IF NOT EXISTS idx_petshops_geom
            ON petshops USING GIST(geom)
        ');
    }

    public function down(): void
    {
        DB::statement('DROP INDEX IF EXISTS idx_petshops_geom');
        DB::statement('ALTER TABLE petshops DROP COLUMN IF EXISTS geom');
    }
};
