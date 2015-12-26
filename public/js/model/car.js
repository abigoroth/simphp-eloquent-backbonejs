CarWash.Models.Car = Backbone.Model.extend({
		urlRoot: '../car'
});

CarWash.Collections.cars = Backbone.Collection.extend({
	model: CarWash.Models.Car,
	url: "../cars",
	initialize: function(){
		console.log("Collection initialize");
	}
})
//user = new CarWash.Models.User({id: 1});