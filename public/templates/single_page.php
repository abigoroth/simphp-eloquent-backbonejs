<html>
<head>
  <title>Car Wash System</title>
  <link href="bbmodel/css/tableindex.css" rel="stylesheet" >
  <link rel="stylesheet" href="css/jqueryui1.11.css">
</head>
<body>
  <script src="js/scripts/jquery1.11.js"></script>
  <script src="js/scripts/jqueryUI.js"></script>
  <script src="js/scripts/underscore.js"></script>
  <script src="js/scripts/backbone.js"></script>
  <script src="js/scripts/require.js"></script>
  <script src="js/model/model.js"></script>
	<script src="http://maps.google.com/maps/api/js"></script>
  <!--script src="js/app.js"></script -->
  <?php //echo "test " . $name; ?>
  <script src="js/scripts/gmaps.js"></script>
  <style type="text/css">
    #map {
      width: 400px;
      height: 400px;
    }
  </style>
  <div id="map_wrapper" style="display:none;padding:0 !important;">
  	<input type="text" id="address" placeholder="Your address">
		<a class="geocode">Search</a>
  	<script>
  		$(".geocode").click(function(){
				GMaps.geocode({
				  address: $('#address').val(),
				  callback: function(results, status) {
				    if (status == 'OK') {
				      var latlng = results[0].geometry.location;
				      store_latlng(latlng.lat(), latlng.lng());
				    }
				  }
				});
  		})
  	</script>
  	<div id="map"></div>
  	<input type="hidden" id="lat">
  	<input type="hidden" id="lnt">
  </div>
  <script>
    map = new GMaps({
		  div: "#map",
		  lat: -12.043333,
		  lng: -77.028333,
		  width: '400px',
		  height: '300px',
		  click: function(e) {
		    alert('click');
		    store_latlng(e.latLng.lat(), e.latLng.lng());
		  },
		  dragend: function(e) {
		   	map.removeMarkers();
		  }
    });
    function store_latlng(lat, lng){
		    $("#lat").val(lat);
		    $("#lng").val(lng);
		    map.setCenter(lat, lng);
	      map.addMarker({
	        lat: lat,
	        lng: lng
	      });
	      if (confirm("Are you sure with this location?")){
	      	$("#map_wrapper").dialog("close");
	      	$("#new_wash > input[name='locationWT']").val(lat + " , " + lng);
	      }
    }
		Backbone.View.prototype.close = function(){
		  this.remove();
		  this.unbind();
		  if (this.onClose){
		    this.onClose();
		  }
		}
  </script>

<div id="mainContainer"></div>
 
<script type="text/javascript">
// prefix naming to avoid conflicts
var CarWash = {
    Models: {},
    Collections: {},
    Views: {},
    Templates:{} // tak pakai pun
}
</script>

<script src="js/scripts/car.js"></script>
<script src="js/scripts/washing_times.js"></script>

<script>
var car = new CarWash.Models.Car({id: 1, modelC: "Waja", brandC: "Proton", registrationC: "AAKK2232"});
var cars = new CarWash.Collections.cars([car]);
cars_view = new CarWash.Views.Cars({collection: cars})

washing_time = new CarWash.Models.WashingTime({
	id: 1,
	dateWT: "2015-12-25", 
	timeWT: "16:00", 
	locationWT: "1.2323, 1.44545",
	statusWT: "Done", 
	washing_categories_idWC: 1,
	cars_idC: 1
});

washing_time2 = new CarWash.Models.WashingTime({
	id: 2,
	dateWT: "2015-12-25", 
	timeWT: "16:00", 
	locationWT: "1.2323, 1.44545",
	statusWT: "Done", 
	washing_categories_idWC: 1,
	cars_idC: 1
});

washing_times = new CarWash.Collections.WashingTimes([washing_time, washing_time2], {car_id: 1});
washingTimesView = new CarWash.Views.WashingTimes({ collection: washing_times , id: 1 }); //!!!! Add this line

var AppRouter = Backbone.Router.extend({
  routes: {
      "": "showHome",
      "/cars": "showCars",
      "/cars/:id": "showCar" 
  },
  showHome: function(){

  },
  showCars: function(){
  	cars_view.render();
  	// app_router.showView(new CarWash.Views.Cars({collection: cars}) );
		// carsView.render();
		cars.fetch();
  },
  showCar: function(id){
		// app_router.showView( new CarWash.Views.WashingTimes({ collection: washing_times , id: id }) );
		// washingTimesView.configure({ collection: washing_times , id: id });
		// washing_times.id = id;
		washingTimesView.setCarId(id);
		washing_times.car_id = id;
		washingTimesView.render();
		washing_times.fetch();
  },

  showView: function(view) {
      if (this.currentView){
    		console.log("currentView detected");
        this.currentView.close();
      }
      this.currentView = view;
      this.currentView.render();
  }
});

// Instantiate the router
app_router = new AppRouter;
/*
// Example of how to trigger on route access
app_router.on('route:showCars', function (id) {
    // Note the variable in the route definition being passed in here
    alert( "Get post number " + id );   
});
*/
// Start Backbone history a necessary step for bookmarkable URL's
Backbone.history.start();

</script>
<style>
	.hide {
		display:none;
	}
</style>
</body>
</html>