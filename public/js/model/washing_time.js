CarWash.Models.WashingTime = Backbone.Model.extend({
		urlRoot: '../washing_time'
});

CarWash.Collections.WashingTimes = Backbone.Collection.extend({
	model: CarWash.Models.WashingTime,
	initialize: function(attr , options){
		this.car_id = options.car_id
		console.log("Collection initialize");
		console.log(options);
		console.log(this.car_id);
	},
	url: function(){ 
		return "../washing_times/"+this.car_id
	},
	// setId: function(id){
		
	// }
})
//user = new CarWash.Models.User({id: 1});