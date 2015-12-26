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
        this.collection.each(this.addOne);
    },
  
    addOne: function (model) {
        if (model.id != null){        
            view = new CarWash.Views.Car({ model: model });
            $("tbody", this.el).append(view.render());
        }
    },

    events: {
    	"click .newCarBtn": function(e){
    		$("#new_car").show();
    		e.preventDefault();
    	},
    	"click #new_car > .save": "createCar"
    },

    createCar: function(e){
			e.preventDefault();
			$("#new_car").hide();
			car = new CarWash.Models.Car({
				modelC: $("#new_car > input[name='modelC']").val(), 
				brandC: $("#new_car > input[name='brandC']").val(),
				registrationC: $("#new_car > input[name='registrationC']").val()
			});
			car.save(null, {
                success: function(){
                    console.log("successfully add to db");
                    cars.add(car);
                }
            });
    }

});
