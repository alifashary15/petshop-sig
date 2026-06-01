@extends('layouts.app')

@section('content')

{{-- ── Hero ── --}}
<div style="position:relative; padding: 56px 0 44px; text-align:center; overflow:hidden;">
    <div style="position:absolute;top:-80px;left:50%;transform:translateX(-50%);width:600px;height:600px;background:radial-gradient(circle, rgba(255,107,43,0.10) 0%, transparent 70%);pointer-events:none;"></div>

    <p style="font-size:0.78rem;letter-spacing:3px;text-transform:uppercase;color:var(--accent);font-weight:700;margin-bottom:14px;">
        🐾 Sistem Informasi Geografis
    </p>
    <h1 style="font-family:'Nunito',sans-serif;font-weight:900;font-size:clamp(2rem,5vw,3.4rem);line-height:1.1;margin-bottom:18px;color:var(--text);">
        Temukan Petshop Terbaik<br>
        <span style="color:var(--accent);">di Medan Tembung</span>
    </h1>
    <p style="color:var(--text-muted);font-size:1rem;max-width:520px;margin:0 auto 34px;line-height:1.7;">
        Platform GIS interaktif untuk menemukan layanan petshop terdekat — lengkap dengan peta,
        rating, jam operasional, dan kontak langsung.
    </p>
    <div class="d-flex justify-content-center gap-3 flex-wrap">
        <a href="{{ route('maps') }}" class="btn-accent">
            🗺️ &nbsp;Buka Peta Interaktif
        </a>
        <a href="{{ route('place') }}" class="btn-ghost">
            Lihat Semua Petshop →
        </a>
    </div>
</div>

{{-- ── Stats ── --}}
<div class="row g-3 mb-5">
    <div class="col-4">
        <div class="stat-chip">
            <div class="stat-num">{{ $totalShops }}</div>
            <div class="stat-label">Petshop Terdaftar</div>
        </div>
    </div>
    <div class="col-4">
        <div class="stat-chip">
            <div class="stat-num">{{ number_format($avgRating, 1) }}</div>
            <div class="stat-label">Rata-rata Rating</div>
        </div>
    </div>
    <div class="col-4">
        <div class="stat-chip">
            <div class="stat-num">{{ number_format($totalReview) }}</div>
            <div class="stat-label">Total Ulasan</div>
        </div>
    </div>
</div>

{{-- ── Feature Cards ── --}}
<div class="row g-4 mb-5">
    <div class="col-md-4">
        <div class="app-card p-4 h-100">
            <div style="width:48px;height:48px;background:var(--accent-soft);border-radius:12px;display:flex;align-items:center;justify-content:center;font-size:1.5rem;margin-bottom:16px;border:1.5px solid var(--border);">📍</div>
            <h5 style="font-family:'Nunito',sans-serif;font-weight:800;margin-bottom:8px;color:var(--text);">Lokasi Akurat</h5>
            <p style="color:var(--text-muted);font-size:0.88rem;line-height:1.65;">
                Data koordinat GPS setiap petshop divisualisasikan di peta secara real-time dengan marker berwarna.
            </p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="app-card p-4 h-100">
            <div style="width:48px;height:48px;background:var(--accent-soft);border-radius:12px;display:flex;align-items:center;justify-content:center;font-size:1.5rem;margin-bottom:16px;border:1.5px solid var(--border);">⭐</div>
            <h5 style="font-family:'Nunito',sans-serif;font-weight:800;margin-bottom:8px;color:var(--text);">Filter Cerdas</h5>
            <p style="color:var(--text-muted);font-size:0.88rem;line-height:1.65;">
                Saring berdasarkan rating, jumlah ulasan, dan kecamatan untuk hasil yang paling relevan.
            </p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="app-card p-4 h-100">
            <div style="width:48px;height:48px;background:var(--accent-soft);border-radius:12px;display:flex;align-items:center;justify-content:center;font-size:1.5rem;margin-bottom:16px;border:1.5px solid var(--border);">💬</div>
            <h5 style="font-family:'Nunito',sans-serif;font-weight:800;margin-bottom:8px;color:var(--text);">Kontak Langsung</h5>
            <p style="color:var(--text-muted);font-size:0.88rem;line-height:1.65;">
                Hubungi petshop via WhatsApp langsung dari popup peta — tanpa perlu copy nomor manual.
            </p>
        </div>
    </div>
</div>

{{-- ── CTA ── --}}
<div class="app-card p-5 text-center" style="background: linear-gradient(135deg, #fff5ee 0%, #fff0e6 100%); border-color: var(--border);">
    <div style="font-size:2.5rem;margin-bottom:12px;">🐈</div>
    <h3 style="font-family:'Nunito',sans-serif;font-weight:900;margin-bottom:10px;color:var(--text);">Siap mencari petshop?</h3>
    <p style="color:var(--text-muted);margin-bottom:24px;font-size:0.9rem;">
        Gunakan peta interaktif kami dengan filter lengkap untuk pengalaman terbaik.
    </p>
    <a href="{{ route('maps') }}" class="btn-accent">
        Mulai Sekarang 🐾
    </a>
</div>

@endsection