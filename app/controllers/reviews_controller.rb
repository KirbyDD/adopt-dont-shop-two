class ReviewsController < ApplicationController

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    review = shelter.reviews.create(review_params)
    review.save

    redirect_to "/shelters/#{shelter.id}"
  end

  def edit
    @shelter = Shelter.find(params[:shelter_id])
    @review = Review.find(params[:id])
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    review.save
    redirect_to "/shelters/#{review.shelter_id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content)
  end
end
