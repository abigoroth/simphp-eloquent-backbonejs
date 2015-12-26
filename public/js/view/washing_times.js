CarWash.Views.WashingTimes = Backbone.View.extend({
    el: $("#mainContainer"),
    template: _.template($("#wash-list").html()),
  
    initialize: function () {
        _.bindAll(this, "render", "addOne", "addAll", "createWashingTime");
        this.collection.bind("reset", this.render);
        this.collection.bind("add", this.addOne);
    },
  
    render: function () {
        $(this.el).html(this.template());
        $( "#new_wash > input[name='dateWT']" ).datepicker();
        categories = new CarWash.Collections.Categories()
        categories.fetch({
            success: function(d){
                _.each( d.attributes , function(x){ 
                    $("#washing_categories_idWC").append("<option value="+x.id+">"+x.name+"</option>")
                })
            }
        })
        this.addAll();
    },
  
    addAll: function () {
        this.collection.each(this.addOne);
    },
  
    addOne: function (model) {
        view = new CarWash.Views.WashingTime({ model: model, id: this.options.id });
        $("tbody", this.el).append(view.render());
    },

    events: {
    	"click .new": function(e){
    		$("#new_wash").show();
    		e.preventDefault();
    	},
    	"click #new_wash > .save": "createWashingTime",
        "click #new_wash > input[name='locationWT']": "mapPicker",
    },
    mapPicker: function(){
        GMaps.geolocate({
          success: function(position) {
            map.setCenter(position.coords.latitude, position.coords.longitude);
          },
          error: function(error) {
            alert('Geolocation failed: '+error.message);
          },
          not_supported: function() {
            alert("Your browser does not support geolocation");
          },
          always: function() {
            alert("Done!");
          }
        });
        $("#map_wrapper").dialog({ 
            width: '400', 
            height: '300',
            title: 'Select your location'
        })
        map.refresh();
    },
    createWashingTime: function(e){
			e.preventDefault();
			$("#new_wash").hide();
			washing_time = new CarWash.Models.WashingTime({
                dateWT: this.$el.find("#new_wash > input[name='dateWT']").val(),
                timeWT: this.$el.find("#new_wash > input[name='timeWT']").val(),
                locationWT: this.$el.find("#new_wash > input[name='locationWT']").val(),
                statusWT: this.$el.find("#new_wash > input[name='statusWT']").val(),
                washing_categories_idWC: this.$el.find("#new_wash > select[name='washing_categories_idWC']").val(),
                cars_idC: this.options.id
			});
			washing_time.save();
			washing_times.add(washing_time);
    },
    onClose: function(){
        if (this.model != undefined){
            this.model.unbind("change", this.render);
            console.log("CLOSE CALLED")
        }
    },
    setCarId: function (id) {
        console.log("configure called");
        this.options.id = id;
    }

});
