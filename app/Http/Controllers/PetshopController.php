<?php

namespace App\Http\Controllers;

use App\Models\Petshop;
use App\Models\Kecamatan;
use Illuminate\Http\Request;

class PetshopController extends Controller
{
    public function home()
    {
        $totalShops  = Petshop::count();
        $avgRating   = round(Petshop::avg('rating'), 1);
        $totalReview = Petshop::sum('review');

        return view('pages.home', compact(
            'totalShops',
            'avgRating',
            'totalReview'
        ));
    }

    public function place(Request $request)
    {
        $query = Petshop::query();

        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'ilike', '%' . $request->search . '%')
                  ->orWhere('kecamatan', 'ilike', '%' . $request->search . '%');
            });
        }

        if ($request->filled('kecamatan')) {
            $query->where('kecamatan', $request->kecamatan);
        }

        $petshops = $query->orderBy('rating', 'desc')->get();

        $kecamatans = Kecamatan::orderBy('name')->pluck('name');

        return view('pages.place', compact(
            'petshops',
            'kecamatans'
        ));
    }

    public function maps(Request $request)
    {
        $query = Petshop::query();

        if ($request->filled('rating')) {
            $query->where('rating', '>=', $request->rating);
        }

        if ($request->filled('min_review')) {
            $query->where('review', '>=', $request->min_review);
        }

        if ($request->filled('kecamatan')) {
            $query->where('kecamatan', $request->kecamatan);
        }

        $petshops = $query->orderBy('rating', 'desc')->get();

        $kecamatans = Kecamatan::orderBy('name')->pluck('name');

        $petshopsJson = $petshops->map(function ($shop) {
            return [
                'id'        => $shop->id,
                'name'      => $shop->name,
                'address'   => $shop->address,
                'kecamatan' => $shop->kecamatan,
                'latitude'  => (float) $shop->latitude,
                'longitude' => (float) $shop->longitude,
                'rating'    => (float) $shop->rating,
                'review'    => (int) $shop->review,
                'workhour'  => $shop->workhour,
                'contact'   => $shop->contact,
                'image'     => $shop->image,
                'service'   => $shop->service
            ];
        });

        return view('pages.maps', compact(
            'petshops',
            'kecamatans',
            'petshopsJson'
        ));
    }

}