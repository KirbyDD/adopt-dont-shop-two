class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.new(shelter_params)
		if shelter.save
			flash[:success] = "Shelter Creation Complete!"
    	redirect_to "/shelters"
		else
			flash[:error] = "Shelter not created: Required information missing."
			redirect_to "/shelters/new"
		end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.destroy
    redirect_to '/shelters'
  end


  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    if shelter.save
			flash[:success] = "Update Complete!"
    	redirect_to "/shelters"
		else
			flash[:error] = "Shelter not updated: Required information missing."
			redirect_to "/shelters/#{shelter.id}/edit"
		end
  end

  private
  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
