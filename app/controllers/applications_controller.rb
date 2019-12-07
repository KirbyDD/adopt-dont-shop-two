class ApplicationsController < ApplicationController
	def index
		@applications = Application.all
	end

	def new
		@favorites = []
	    ids = session[:favorites].keys
		ids.each do |id|
			@favorites << Pet.find(id)
		end
	end

	def create
		application = Application.create(app_params)
		# application = Application.find(params[:application_id])
		redirect_to '/applications'
	end 

	private

	def app_params
		@favorites = []
	    ids = session[:favorites].keys
		ids.each do |id|
			@favorites << Pet.find(id)
		end
		pet_selected = Array.new
		@favorites.each do |fav|
			pet_selected << params[fav.name]
		end
		params.permit(pet_selected, :name, :address, :city, :state, :zip, :phone_number, :why_would_you_make_a_good_pet_owner)
	end
end
