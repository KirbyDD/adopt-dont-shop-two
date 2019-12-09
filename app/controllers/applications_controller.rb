class ApplicationsController < ApplicationController
	def favorites
		favorites = []
	    ids = session[:favorites].keys
		ids.each do |id|
		  favorites << Pet.find(id)
	    end
	  favorites
	end
	
	def index
		@applications = Application.all
	end

	def new
		@favorites = favorites
	end

	def create
		application = Application.new(app_params)
		if application.save
			favorites.each do |favorite|
			  flash["#{favorite.name}"] = "Application sent for: #{favorite.name}"
			  session[:favorites].delete(favorite.id.to_s)
			end
			redirect_to '/favorites'
		
	    else
		  redirect_to "/applications/new"
          flash[:error] = 'Application not created: Required information missing.'
	    end
	end 

	private

	def app_params
		pet_selected = Array.new
		favorites.each do |fav|
			if params[fav.name]
				pet_selected << params[fav.name]
			end
		end
		params.permit(pet_selected, :name, :address, :city, :state, :zip, :phone_number, :why_would_you_make_a_good_pet_owner)
	end
end
