<?php

require __DIR__.'/../vendor/autoload.php';

$app = new Slim\Slim();

$app->get('/', function() {
    $user = User::first();
    //$user->username = "Test User";
    // $user->save();
    // $awek = $user->aweks->first();
    // echo "Hello, $awek->name!";
    $app = Slim\Slim::getInstance();
    $app->render(
			'single_page.php',
    	array( 'name' => 'Josh' )
		);
});

/* CAR START */
$app->get("/user/:id", "getUserById");
function getUserById($id){
	$user = User::find($id);
	echo $user;
}

$app->get("/car/:id", "getCarById");
function getCarById($id){
	$car = Car::find($id);
	echo $car;
}

$app->get("/cars", function(){
	$cars = Car::all();
	echo $cars;
});

$app->delete("/cars/:id", "deleteCar");
function deleteCar($id){
	$car = Car::destroy($id);
	echo "done";
}

$app->post("/car", "createCar");
function createCar(){
	$request = Slim\Slim::getInstance()->request();

	$car = json_decode($request->getBody());

	$car = Car::create([
		'users_idU' => 1,
		'modelC' => $car->modelC,
		'brandC' => $car->brandC,
		'registrationC' => $car->registrationC
		]);

	echo $car;
}

$app->put("/cars/:id", "updateCar");
function updateCar($id){
	$request = Slim\Slim::getInstance()->request();
	$car = Car::find($id);
	$car_getbody = json_decode($request->getBody());

	$car->modelC = $car_getbody->modelC;
	$car->brandC = $car_getbody->brandC;
	$car->registrationC = $car_getbody->registrationC;
	$car->save();

	echo $car;
}
/* END OF CAR */

$app->get("/categories", "getCategories");
function getCategories(){
	$categories = Category::all();
	echo $categories;
}

/* WASHING TIME START */
$app->get("/washing_time/:id", "getWashingTimeById");
function getWashingTimeById($id){
	$washing_time = WashingTime::find($id);
	echo $washing_time;
}

$app->get("/washing_times/:id", "getWashingTimesByCarId");

function getWashingTimesByCarId($id){
	// $id = settype( $id , "integer");
	$washing_times = WashingTime::where('cars_idC', '=', $id )->get();
	echo $washing_times;
}

$app->delete("/washing_times/:car_id/:id", "deleteWashingTime");
function deleteWashingTime($car_id, $id){
	$washing_time = WashingTime::destroy($id);
	echo $id;
}

$app->post("/washing_time", "createWashingTime");
function createWashingTime(){
	$request = Slim\Slim::getInstance()->request();

	$washing_time = json_decode($request->getBody());

	$washing_time = WashingTime::create([
		'dateWT' => $washing_time->dateWT, 
		'timeWT' => $washing_time->timeWT, 
		'locationWT' => $washing_time->locationWT, 
		'statusWT' => $washing_time->statusWT,
		'washing_categories_idWC' => $washing_time->washing_categories_idWC,
		'cars_idC' => $washing_time->cars_idC
		]);

	echo $washing_time;
}

$app->put("/washing_times/:car_id/:id", "updateWashingTime");
function updateWashingTime($car_id, $id){
	$request = Slim\Slim::getInstance()->request();
	$washing_time = WashingTime::find($id);
	$washing_time_getbody = json_decode($request->getBody());

	$washing_time->dateWT = $washing_time_getbody->dateWT;
	$washing_time->timeWT = $washing_time_getbody->timeWT;
	$washing_time->locationWT = $washing_time_getbody->locationWT;
	$washing_time->statusWT = $washing_time_getbody->statusWT;
	$washing_time->washing_categories_idWC = $washing_time_getbody->washing_categories_idWC;
	$washing_time->cars_idC = $washing_time_getbody->cars_idC;

	$washing_time->save();

	echo $washing_time;
}
/* END OF WASHING TIME */

$app->run();