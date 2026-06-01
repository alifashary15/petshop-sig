<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PetshopBase extends Model
{
    protected $table = 'petshops';

    protected $primaryKey = 'id';

    public $timestamps = false;

    protected $fillable = [
        'name',
        'address',
        'kecamatan_id',
        'latitude',
        'longitude',
        'workhour_open',
        'workhour_close',
        'rating',
        'contact',
        'review',
        'image'
    ];
}