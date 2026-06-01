<?php

use Illuminate\Support\Facades\Route;

Route::get('/', ['App\Http\Controllers\PetshopController', 'home'])->name('home');
Route::get('/place', ['App\Http\Controllers\PetshopController', 'place'])->name('place');
Route::get('/maps', ['App\Http\Controllers\PetshopController', 'maps'])->name('maps');
Route::get('/admin/petshop/create', ['App\Http\Controllers\PetshopController', 'create'])->name('petshop.create');
Route::post('/admin/petshop', ['App\Http\Controllers\PetshopController', 'store'])->name('petshop.store');