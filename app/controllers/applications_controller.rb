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
		if params[:pet_id]
			if Pet.find(params[:pet_id]).applications.empty?
				flash[:notice] = "There are currently no applications for this pet."
			else params[:pet_id]
				@pets = Pet.find(params[:pet_id])
			end
		else
			@applications = Application.all
		end
	end

	def show
		@application = Application.find(params[:application_id])
	end

	def new
		@favorites = favorites
	end

	def create
		# binding.pry
		app_pets = []
		keys = params.keys
		keys.each do |key|
			if key.include?("pet-")
				pet = Pet.find(params[key])
				app_pets << pet
			end
		end
		if app_pets.count == 0
			flash[:error] = 'Application not created: Required information missing.'
		  redirect_to "/applications/new"
		end
		app_pets.each do |pet|
			pet.applications.create(app_params)
			# application = Application.new(app_params)
			if pet.applications
					flash["#{pet.name}"] = "Application sent for: #{pet.name}"
					session[:favorites].delete(pet.id.to_s)
				if pet == app_pets.last
					redirect_to '/favorites'
				end
			else
        flash[:error] = 'Application not created: Required information missing.'
		  	redirect_to "/applications/new"
			end
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
