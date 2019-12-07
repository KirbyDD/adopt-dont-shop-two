class ApplicationsController < ApplicationController
	def index
		@applications = Application.all
	end

	def new
	end

	def create
		application = Application.find(params[:application_id])
	end 
end
