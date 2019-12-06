class ReviewsController < ApplicationController

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    review = shelter.reviews.create(review_params)

    if review.save
      flash[:success] = 'Update Complete'
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:notice] = 'Review not created: Required information missing.'
      redirect_to "/shelters/#{shelter.id}/reviews/new"
    end

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
    shelter = Shelter.find(params[:shelter_id])
    review = Review.find(params[:id])
    review.update(review_params)

    if review.save
      flash[:success] = 'Update Complete'
    redirect_to "/shelters/#{review.shelter_id}"
    else
      flash[:notice] = 'Review not updated: Required information missing.'
      redirect_to "/shelters/#{shelter.id}/reviews/#{review.id}/edit"
    end
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :optional_picture)
  end
end
