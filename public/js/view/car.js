CarWash.Views.Car = Backbone.View.extend({
	template: _.template($("#car_tr").html()),
	tagName:"tr",
	initialize: function(){
		console.log("view instantiated");
		_.bindAll(this , 'render', 'carClick', 'saveModel');
    this.model.on("change", this.render);
    this.model.on("destroy", this.remove, this);
		// this.render();
	},
	render: function(){
		return $(this.el).html(this.template(this.model.toJSON()))
	},
	events: {
		//"click span": "carClick",
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
		// app_router.navigate("#/cars/" + this.model.id, true)

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