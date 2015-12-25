<html>
<head>
  <title>Car Wash System</title>
  <link href="bbmodel/css/tableindex.css" rel="stylesheet" >
</head>
<body>
  <script src="js/scripts/jquery1.11.js"></script>
  <script src="js/scripts/jqueryUI.js"></script>
  <script src="js/scripts/underscore.js"></script>
  <script src="js/scripts/backbone.js"></script>
  <script src="js/scripts/require_template.js"></script>
  <script src="js/model/model.js"></script>
  <!--script src="js/app.js"></script -->
  <?php //echo "test " . $name; ?>
     
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

<script>
var AppRouter = Backbone.Router.extend({
  routes: {
      "": "showHome",
      "/cars": "showCars" 
  },
  showHome: function(){

  },
  showCars: function(){
		carsView.render();
		cars.fetch();
  }
});

// Instantiate the router
var app_router = new AppRouter;
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