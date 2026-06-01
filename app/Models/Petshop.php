<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Petshop extends Model
{
    protected $table = 'petshops_full';

    protected $primaryKey = 'id';

    public $timestamps = false;
}