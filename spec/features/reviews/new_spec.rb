require 'rails_helper'

RSpec.describe "Creating a new review" do

  before(:each) do
     @new_shelter = Shelter.create(name: 'Denver Dumb Friends League',
                                  address: '1234 Colorado Blvd.',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: 80003)

    @new_review = @new_shelter.reviews.create(title: "GOOD!",
                                             rating: 5,
                                             content: "This shelter was GOOD!",
                                             optional_picture: "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg")
  end
  it "can create a review" do

    title = "Good!"
    rating = 5
    content = "This shelter was Good!"
    optional_picture = "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg"

    visit "/shelters/#{@new_shelter.id}/reviews/new"

    fill_in :title, with: title
    fill_in :rating, with: rating
    fill_in :content, with: content
    fill_in :optional_picture, with: optional_picture

    click_on "Add New Review"

    expect(current_path).to eq("/shelters/#{@new_shelter.id}")
    expect(page).to have_content(title)
    expect(page).to have_content(rating)
    expect(page).to have_content(content)
    expect(page).to have_css("img[src*='#{@new_review.optional_picture}']")
  end

  it "can show flash message when field is not filled" do

    visit "/shelters/#{@new_shelter.id}/reviews/new"

    fill_in :title, with: title

    click_on "Add New Review"
    
    expect(page).to have_content('Review not created: Required information missing.')
    expect(current_path).to eq("/shelters/#{@new_shelter.id}/reviews/new")
    expect(page).to have_button('Add New Review')
  end
end
