@extends('layouts.app')

@section('content')

<div class="mb-2">
    <h2 class="section-title">Peta Interaktif</h2>
    <p class="section-subtitle">{{ $petshops->count() }} petshop ditampilkan</p>
</div>

{{-- FILTER --}}
<div class="filter-card">
    <div class="row g-3">

        <div class="col-md-3">
            <label>Cari</label>
            <input type="text" id="search" class="form-control">
        </div>

        <div class="col-md-2">
            <label>Min Rating</label>
            <select id="rating" class="form-select">
                <option value="">Semua</option>
                <option value="4">4+</option>
                <option value="4.5">4.5+</option>
            </select>
        </div>

        <div class="col-md-2">
            <label>Min Review</label>
            <input type="number" id="review" class="form-control">
        </div>

        <div class="col-md-2">
            <label>Kecamatan</label>
            <select id="kecamatan" class="form-select">
                <option value="">Semua</option>
                @foreach($kecamatans as $k)
                    <option value="{{ $k }}">{{ $k }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-md-2">
            <label>Radius (KM)</label>
            <select id="radius" class="form-select">
                <option value="">Semua</option>
                <option value="1">1 KM</option>
                <option value="3">3 KM</option>
                <option value="5">5 KM</option>
            </select>
        </div>

        {{-- BUTTON --}}
        <div class="col-md-1 d-flex gap-1 align-items-end">
            <button id="btn-lokasi" class="btn-accent w-100">📍</button>
        </div>

        {{-- RESET --}}
        <div class="col-md-12">
            <button id="resetFilter" class="btn-ghost w-100 mt-2">
                🔄 Reset Semua Filter
            </button>
        </div>

    </div>
</div>

<div id="map"></div>

<script id="petshops-data" type="application/json">
{!! json_encode($petshopsJson) !!}
</script>

@endsection


@section('scripts')

<style>
#map {
    height: 500px;
    border-radius: 12px;
}

.custom-marker {
    background: transparent !important;
    border: none !important;
}
</style>

<script>

var petshops = JSON.parse(document.getElementById('petshops-data').textContent);

var map = L.map('map').setView([3.606, 98.719], 13);

L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
    attribution: '© OpenStreetMap',
}).addTo(map);

let userLat = null;
let userLng = null;
let userMarker = null;
let circle = null;

// warna
function getColor(r) {
    if (r >= 4.5) return '#4caf50';
    if (r >= 4) return '#f5a623';
    return '#e94560';
}

// icon
function makeIcon(r) {
    return L.divIcon({
        className: 'custom-marker',
        html: `<div style="
            background:${getColor(r)};
            width:28px;
            height:28px;
            border-radius:50%;
            display:flex;
            align-items:center;
            justify-content:center;
            color:white;
            font-size:11px;
            font-weight:bold;
            box-shadow:0 2px 6px rgba(0,0,0,0.4);
        ">${r}</div>`,
        iconSize: [28,28],
        iconAnchor: [14,14]
    });
}

// jarak
function getDistance(lat1, lon1, lat2, lon2) {
    const R = 6371;
    const dLat = (lat2-lat1) * Math.PI/180;
    const dLon = (lon2-lon1) * Math.PI/180;

    const a =
        Math.sin(dLat/2)**2 +
        Math.cos(lat1*Math.PI/180) *
        Math.cos(lat2*Math.PI/180) *
        Math.sin(dLon/2)**2;

    return R * (2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)));
}

// render
function renderMarkers() {

    map.eachLayer(function(layer){
        if (layer instanceof L.Marker && layer !== userMarker) {
            map.removeLayer(layer);
        }
    });

    let search    = document.getElementById('search').value.toLowerCase();
    let rating    = document.getElementById('rating').value;
    let review    = document.getElementById('review').value;
    let kecamatan = document.getElementById('kecamatan').value;
    let radius    = document.getElementById('radius').value;

    petshops.forEach(function(s){

        if (search && !(s.name.toLowerCase().includes(search) || s.kecamatan.toLowerCase().includes(search))) return;
        if (rating && s.rating < rating) return;
        if (review && s.review < review) return;
        if (kecamatan && s.kecamatan !== kecamatan) return;

        if (radius && userLat && userLng) {
            let dist = getDistance(userLat, userLng, s.latitude, s.longitude);
            if (dist > radius) return;
        }

        var popup = `
        <div style="min-width:200px">
            ${s.image ? `<img src="${s.image}" style="width:100%;height:110px;object-fit:cover;border-radius:8px;margin-bottom:6px;">` : ''}
            <b>${s.name}</b><br>
            ⭐ ${s.rating} (${s.review})<br>
            📍 ${s.address}
        </div>`;

        L.marker([s.latitude, s.longitude], { icon: makeIcon(s.rating) })
         .addTo(map)
         .bindPopup(popup);
    });
}

// lokasi user
document.getElementById('btn-lokasi').onclick = function(e){
    e.preventDefault();

    navigator.geolocation.getCurrentPosition(function(pos){

        userLat = pos.coords.latitude;
        userLng = pos.coords.longitude;

        if (userMarker) map.removeLayer(userMarker);
        if (circle) map.removeLayer(circle);

        userMarker = L.marker([userLat, userLng])
            .addTo(map)
            .bindPopup("📍 Lokasi Kamu")
            .openPopup();

        map.setView([userLat, userLng], 14);

        drawRadius();
        renderMarkers();
    });
};

// radius circle
function drawRadius(){
    let radius = document.getElementById('radius').value;

    if (circle) map.removeLayer(circle);

    if (radius && userLat && userLng) {
        circle = L.circle([userLat, userLng], {
            radius: radius * 1000,
            color: '#4caf50',
            fillOpacity: 0.1
        }).addTo(map);
    }
}

// 🔥 RESET FILTER
document.getElementById('resetFilter').onclick = function(){

    document.getElementById('search').value = '';
    document.getElementById('rating').value = '';
    document.getElementById('review').value = '';
    document.getElementById('kecamatan').value = '';
    document.getElementById('radius').value = '';

    // hapus lokasi & circle
    userLat = null;
    userLng = null;

    if (userMarker) map.removeLayer(userMarker);
    if (circle) map.removeLayer(circle);

    map.setView([3.606, 98.719], 13);

    renderMarkers();
};

// trigger filter
['search','rating','review','kecamatan','radius'].forEach(id => {
    document.getElementById(id).addEventListener('input', function(){
        drawRadius();
        renderMarkers();
    });
});

// init
renderMarkers();

</script>

@endsection