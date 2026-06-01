<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPoint — Sistem Informasi Geografis Petshop Medan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&family=Plus+Jakarta+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary:    #fff8f2;
            --accent:     #ff6b2b;
            --accent-hover: #e85a1a;
            --accent2:    #ffb347;
            --accent-soft:#fff0e6;
            --surface:    #ffffff;
            --card-bg:    #ffffff;
            --border:     #ffe4cc;
            --text:       #2d1a0e;
            --text-muted: #9e7560;
            --radius:     16px;
            --shadow:     0 4px 24px rgba(255,107,43,0.10);
            --shadow-hover: 0 12px 36px rgba(255,107,43,0.18);
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            background-color: var(--primary);
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--text);
            min-height: 100vh;
        }

        /* ── Navbar ── */
        .navbar {
            background: rgba(255,255,255,0.92);
            backdrop-filter: blur(16px);
            border-bottom: 1.5px solid var(--border);
            padding: 12px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 16px rgba(255,107,43,0.07);
        }

        .navbar-brand {
            font-family: 'Nunito', sans-serif;
            font-weight: 900;
            font-size: 1.5rem;
            color: var(--accent) !important;
            letter-spacing: -0.5px;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .navbar-brand .paw {
            font-size: 1.3rem;
            animation: pawBounce 2s ease-in-out infinite;
        }
        @keyframes pawBounce {
            0%, 100% { transform: rotate(-10deg) scale(1); }
            50%       { transform: rotate(10deg) scale(1.15); }
        }
        .navbar-brand span { color: var(--text); font-weight: 700; }

        .nav-link {
            color: var(--text-muted) !important;
            font-weight: 600;
            font-size: 0.88rem;
            padding: 7px 16px !important;
            border-radius: 8px;
            transition: all 0.2s;
        }
        .nav-link:hover {
            color: var(--accent) !important;
            background: var(--accent-soft);
        }
        .nav-link.active {
            color: var(--accent) !important;
            background: var(--accent-soft);
        }

        /* ── Page Wrapper ── */
        .page-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px 80px;
        }

        /* ── Section Headings ── */
        .section-title {
            font-family: 'Nunito', sans-serif;
            font-weight: 800;
            font-size: 1.8rem;
            color: var(--text);
            margin-bottom: 6px;
        }
        .section-subtitle {
            color: var(--text-muted);
            font-size: 0.9rem;
            margin-bottom: 28px;
        }

        /* ── Cards ── */
        .app-card {
            background: var(--card-bg);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            overflow: hidden;
            transition: transform 0.25s, box-shadow 0.25s;
            box-shadow: var(--shadow);
        }
        .app-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-hover);
            border-color: var(--accent2);
        }

        /* ── Badges ── */
        .badge-rating {
            background: linear-gradient(135deg, var(--accent), var(--accent2));
            color: #fff;
            font-weight: 700;
            font-size: 0.78rem;
            padding: 4px 10px;
            border-radius: 20px;
        }

        /* ── Buttons ── */
        .btn-accent {
            background: var(--accent);
            color: #fff;
            border: none;
            font-weight: 700;
            font-family: 'Nunito', sans-serif;
            border-radius: 10px;
            padding: 10px 24px;
            transition: all 0.2s;
            cursor: pointer;
            display: inline-block;
            text-decoration: none;
        }
        .btn-accent:hover {
            background: var(--accent-hover);
            color: #fff;
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(255,107,43,0.3);
        }
        .btn-ghost {
            background: transparent;
            color: var(--text-muted);
            border: 1.5px solid var(--border);
            font-weight: 600;
            border-radius: 10px;
            padding: 10px 20px;
            transition: all 0.2s;
            display: inline-block;
            text-decoration: none;
        }
        .btn-ghost:hover {
            border-color: var(--accent);
            color: var(--accent);
            background: var(--accent-soft);
        }

        /* ── Map ── */
        #map {
            height: 520px;
            border-radius: var(--radius);
            border: 1.5px solid var(--border);
            box-shadow: var(--shadow);
        }

        /* ── Filter Card ── */
        .filter-card {
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            padding: 20px 24px;
            margin-bottom: 24px;
            box-shadow: var(--shadow);
        }
        .filter-card label {
            color: var(--text-muted);
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
        }
        .filter-card .form-control,
        .filter-card .form-select {
            background: var(--primary);
            border: 1.5px solid var(--border);
            color: var(--text);
            border-radius: 10px;
            font-size: 0.88rem;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }
        .filter-card .form-control::placeholder { color: var(--text-muted); }
        .filter-card .form-control:focus,
        .filter-card .form-select:focus {
            background: #fff;
            color: var(--text);
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(255,107,43,0.12);
        }

        /* ── Place Card ── */
        .place-card .card-img-top {
            height: 170px;
            object-fit: cover;
        }
        .place-card .card-body { padding: 16px; }
        .place-card .card-title {
            font-family: 'Nunito', sans-serif;
            font-weight: 800;
            font-size: 1rem;
            margin-bottom: 6px;
            color: var(--text);
        }
        .place-card .card-text { color: var(--text-muted); font-size: 0.82rem; }
        .place-card .card-footer {
            background: var(--accent-soft);
            border-top: 1.5px solid var(--border);
            padding: 12px 16px;
        }

        /* ── Leaflet popup override ── */
        .leaflet-popup-content-wrapper {
            background: #fff;
            color: var(--text);
            border-radius: 14px;
            border: 1.5px solid var(--border);
            box-shadow: 0 8px 32px rgba(255,107,43,0.15);
        }
        .leaflet-popup-tip { background: #fff; }
        .leaflet-popup-content h6 {
            font-family: 'Nunito', sans-serif;
            font-weight: 800;
            color: var(--text);
        }

        /* ── Stat chips ── */
        .stat-chip {
            background: var(--surface);
            border: 1.5px solid var(--border);
            border-radius: 14px;
            padding: 20px 28px;
            text-align: center;
            box-shadow: var(--shadow);
        }
        .stat-chip .stat-num {
            font-family: 'Nunito', sans-serif;
            font-size: 2.2rem;
            font-weight: 900;
            color: var(--accent);
            line-height: 1;
        }
        .stat-chip .stat-label {
            font-size: 0.82rem;
            color: var(--text-muted);
            font-weight: 500;
            margin-top: 4px;
        }

        /* ── Decorative paw pattern background ── */
        body::before {
            content: '';
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ff6b2b' fill-opacity='0.03'%3E%3Ccircle cx='10' cy='10' r='4'/%3E%3Ccircle cx='20' cy='8' r='3'/%3E%3Ccircle cx='28' cy='10' r='3'/%3E%3Ccircle cx='16' cy='20' r='7'/%3E%3C/g%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 0;
        }
        .page-wrapper, nav { position: relative; z-index: 1; }

        /* ── Footer ── */
        footer {
            text-align: center;
            color: var(--text-muted);
            font-size: 0.8rem;
            padding: 24px 0;
            border-top: 1.5px solid var(--border);
            background: var(--surface);
            position: relative;
            z-index: 1;
        }

        /* ── Service tags ── */
        .service-tag {
            background: var(--accent-soft);
            color: var(--accent);
            font-size: 0.7rem;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 20px;
            border: 1px solid var(--border);
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="{{ route('home') }}">
                <span class="paw">🐾</span>PetPoint
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ms-auto gap-1">
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('home') ? 'active' : '' }}" href="{{ route('home') }}">🏠 Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('place') ? 'active' : '' }}" href="{{ route('place') }}">📋 Place</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('maps') ? 'active' : '' }}" href="{{ route('maps') }}">🗺️ Maps</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="page-wrapper">
        @yield('content')
    </div>

    <footer>
        <p>🐾 © {{ date('Y') }} PetPoint · Sistem Informasi Geografis Petshop Medan Tembung</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    @yield('scripts')
</body>
</html>