
require_template("car_views");

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

car = new CarWash.Models.Car({modelC: "Waja", brandC: "Proton", registrationC: "AAKK2232"});
car2 = new CarWash.Models.Car({modelC: "Wira", brandC: "Proton", registrationC: "AAKK2232"});


cars = new CarWash.Collections.cars([car, car2]);

//VIEWS 

CarWash.Views.Car = Backbone.View.extend({
	template: _.template($("#car_tr").html()),
	tagName:"tr",
	initialize: function(){
		console.log("view instantiated");
		_.bindAll(this , 'render', 'carClick', 'saveModel');
    this.model.on("change", this.render);
    this.model.on("destroy", this.remove, this);
    console.log(this.model);
		// this.render();
	},
	render: function(){
		return $(this.el).html(this.template(this.model.toJSON()))
	},
	events: {
		"click span": "carClick",
		"click .save": "saveModel",
		"click .destroy": "destroyCar",
		"mouseenter span": function(){
			this.$el.css('cursor','pointer');
		},
		"mouseenter span": function(){
			this.$el.css('cursor','default');
		},
		"click .edit": "editModel"
	},

	editModel: function(){
		this.$el.find('span').addClass("hide");
		this.$el.find('input').removeClass("hide");
		this.$el.find('.save').removeClass("hide");
	},

	destroyCar: function(){
		if (confirm("Are you sure?")){
			this.model.destroy();
		}
	},

	carClick: function(e){
		// do on car click here.
	},

	saveModel: function(){
		this.model.set({
			modelC: this.$el.find("input[name='modelC']").val(),
			brandC: this.$el.find("input[name='brandC']").val(),
			registrationC: this.$el.find("input[name='registrationC']").val()
		}); // automatically updates display because on "change" this.render
		this.model.save();
		this.render();
	}
});

CarWash.Views.Cars = Backbone.View.extend({
    el: $("#mainContainer"),
    template: _.template($("#car-list").html()),
  
    initialize: function () {
        _.bindAll(this, "render", "addOne", "addAll");
        this.collection.bind("reset", this.render);
        this.collection.bind("add", this.addOne);
    },
  
    render: function () {
        $(this.el).html(this.template());
        this.addAll();
    },
  
    addAll: function () {
        console.log("addAll")
        this.collection.each(this.addOne);
    },
  
    addOne: function (model) {
        console.log("addOne")
        view = new CarWash.Views.Car({ model: model });
        $("tbody", this.el).append(view.render());
    },

    events: {
    	"click .newCarBtn": function(e){
    		$("#new_car").show();
    		e.preventDefault();
    	},
    	"click .save": "createCar"
    },

    createCar: function(e){
			e.preventDefault();
			$("#new_car").hide();
			car = new CarWash.Models.Car({
				modelC: $("#new_car > input[name='modelC']").val(), 
				brandC: $("#new_car > input[name='brandC']").val(),
				registrationC: $("#new_car > input[name='registrationC']").val()
			});
			car.save();
			cars.add(car);
    }

});

var carsView = new CarWash.Views.Cars({ collection: cars }); //!!!! Add this line
