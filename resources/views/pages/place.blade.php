@extends('layouts.app')

@section('content')

<div class="d-flex align-items-center justify-content-between mb-2 flex-wrap gap-2">
    <div>
        <h2 class="section-title">Daftar Petshop</h2>
        <p class="section-subtitle">{{ $petshops->count() }} petshop ditemukan</p>
    </div>
    <a href="{{ route('maps') }}" class="btn-accent" style="text-decoration:none;font-size:0.85rem;padding:8px 18px;">
        🗺️ Lihat di Peta
    </a>
</div>

{{-- ── Filter ── --}}
<div class="filter-card mb-4">
    <form action="{{ route('place') }}" method="GET" class="row g-3 align-items-end">
        <div class="col-md-5">
            <label>Cari nama / kecamatan</label>
            <input type="text" name="search" class="form-control" placeholder="Contoh: Happy Paws, Medan Tembung..." value="{{ request('search') }}">
        </div>
        <div class="col-md-4">
            <label>Filter Kecamatan</label>
            <select name="kecamatan" class="form-select">
                <option value="">Semua Kecamatan</option>
                @foreach($kecamatans as $k)
                    <option value="{{ $k }}" {{ request('kecamatan') == $k ? 'selected' : '' }}>{{ $k }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-3 d-flex gap-2">
            <button type="submit" class="btn-accent w-100" style="font-size:0.85rem;">Cari</button>
            <a href="{{ route('place') }}" class="btn-ghost w-100" style="font-size:0.85rem;text-decoration:none;text-align:center;line-height:2.2;">Reset</a>
        </div>
    </form>
</div>

{{-- ── Grid Cards ── --}}
@if($petshops->isEmpty())
    <div class="text-center py-5" style="color:var(--text-muted);">
        <div style="font-size:3rem;margin-bottom:16px;">🐾</div>
        <p>Tidak ada petshop yang cocok dengan filter kamu.</p>
        <a href="{{ route('place') }}" class="btn-ghost" style="text-decoration:none;display:inline-block;margin-top:12px;">Reset Filter</a>
    </div>
@else
<div class="row g-4">
    @foreach($petshops as $shop)
    <div class="col-md-4 col-sm-6">
        <div class="app-card place-card h-100">
            {{-- Gambar dari Cloudinary atau fallback gradient --}}
            @if($shop->image)
                <img src="{{ $shop->image }}" class="card-img-top" alt="{{ $shop->name }}" style="height:170px;object-fit:cover;">
            @else
                <div style="height:170px;background:linear-gradient(135deg,#0f3460,#16213e);display:flex;align-items:center;justify-content:center;font-size:3rem;">🐾</div>
            @endif

            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start mb-1">
                    <h5 class="card-title mb-0">{{ $shop->name }}</h5>
                    <span class="badge-rating ms-2 flex-shrink-0">⭐ {{ $shop->rating }}</span>
                </div>
                <p class="card-text mb-1">
                    <span style="color:var(--accent);font-size:0.75rem;">📍</span>
                    {{ $shop->kecamatan }}
                </p>
                <p class="card-text" style="font-size:0.8rem;color:var(--text-muted);line-height:1.5;">{{ Str::limit($shop->address, 70) }}</p>

                @if($shop->workhour)
                <p class="card-text" style="font-size:0.78rem;color:var(--text-muted);">
                    🕐 {{ $shop->workhour }}
                </p>
                @endif

                @if($shop->service)
                <div class="mt-2 d-flex flex-wrap gap-1">
                    @foreach(explode(',', $shop->service) as $svc)
                        <span style="background:var(--accent-soft);color:var(--accent);font-size:0.7rem;padding:2px 8px;border-radius:20px;">{{ trim($svc) }}</span>
                    @endforeach
                </div>
                @endif

                <p style="font-size:0.75rem;color:var(--text-muted);margin-top:8px;">{{ number_format($shop->review) }} ulasan</p>
            </div>

            <div class="card-footer d-flex gap-2">
                <a href="https://www.google.com/maps?q={{ $shop->latitude }},{{ $shop->longitude }}"
                   target="_blank"
                   class="btn-ghost flex-fill"
                   style="text-decoration:none;text-align:center;font-size:0.8rem;padding:8px 10px;">
                    🗺️ Navigasi
                </a>
                @if($shop->contact)
                <a href="https://wa.me/{{ $shop->contact }}"
                   target="_blank"
                   style="background:#25d366;color:#fff;text-decoration:none;text-align:center;font-size:0.8rem;padding:8px 10px;border-radius:10px;font-weight:600;flex:1;">
                    💬 WA
                </a>
                @endif
            </div>
        </div>
    </div>
    @endforeach
</div>
@endif

@endsection