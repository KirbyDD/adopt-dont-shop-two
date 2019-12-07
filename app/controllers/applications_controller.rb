class ApplicationsController < ApplicationsController
	def index
		@applications = Application.all
	end
end
