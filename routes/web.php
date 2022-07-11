<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group([
    'middleware' => 'auth'
], function () {
    Route::get('/exchange-gift', function () {
        return view('welcome');
    })->name('viewExchangeGift');

    Route::get('/', 'HomeController@index')->name('index');
    Route::get('/change-password', 'Auth\ChangePasswordController@index')->name('changePassword.index');
    Route::post('/change-password', 'Auth\ChangePasswordController@store')->name('changePassword.store');
    Route::post('/exchange-gift', 'HomeController@exchangeGift')->name('exchangeGift');
});


Auth::routes();
