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
$app->run();