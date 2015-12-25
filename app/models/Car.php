<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Car extends Eloquent {

	protected $table = 'cars';
	protected $fillable = array('modelC', 'brandC', 'registrationC', 'users_idU');
}