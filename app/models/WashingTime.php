<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class WashingTime extends Eloquent {

	protected $table = 'washing_times';
	protected $fillable = array(
		'dateWT', 
		'timeWT', 
		'locationWT', 
		'statusWT',
		'washing_categories_idWC',
		'cars_idC'
		);
}