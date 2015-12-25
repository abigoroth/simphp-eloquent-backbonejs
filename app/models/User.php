<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class User extends Eloquent {

	protected $table = 'users';

	protected $hidden = array('password');

	// public function aweks(){
 //        return $this->hasMany('Awek');
 //  }
}
