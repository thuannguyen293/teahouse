<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Point extends Model
{
    protected $table = "points";

    protected $fillable = [
        'phone_number', 'point', 'code', 'store_id',
    ];
    public $timestamps = false;
}
