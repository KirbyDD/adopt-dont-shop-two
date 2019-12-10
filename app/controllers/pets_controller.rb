class PetsController < ApplicationController

  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    if session[:favorites]
      session[:favorites].delete(params[:id].to_s)
    end
    redirect_to "/pets"
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def approval
    pet = Pet.find(params[:pet_id])
    pet[:adoptable] = "pending"
    pet.update(pet_params)
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  private

  def pet_params
    params.permit(:image, :name, :approximate_age, :sex, :description, :adoptable)
  end
end
