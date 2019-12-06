class FavoritesController < ApplicationController

	def update
		pet = Pet.find(params[:pet_id])
		pet_id_str = pet.id.to_s
		session[:favorites] ||= Hash.new(0)
		session[:favorites][pet_id_str] ||= 0
		session[:favorites][pet_id_str] += 1
		if session[:favorites][pet_id_str] == 1
		  flash[:notice] = "You have added #{pet.name} to your favorites."
		  redirect_to "/pets"
		else
			flash[:notice] = "You have already added #{pet.name} in your favorites."
			redirect_to "/pets"
		end
	end
end