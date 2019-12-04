require 'rails_helper'

RSpec.describe "Creating a new review" do
  it "can create a review" do
    @new_shelter = Shelter.create(name: 'Denver Dumb Friends League',
                                  address: '1234 Colorado Blvd.',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: 80003)

    @new_review = @new_shelter.reviews.create(title: "GOOD!",
                                             rating: 5,
                                             content: "This shelter was GOOD!",
                                             optional_picture: "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg")

    title = "Good!"
    rating = 5
    content = "This shelter was Good!"
    optional_picture = "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg")

    visit "/shelters/#{shelter.id}/reviews/new"

    fill_in :title, with: title
    fill_in :rating, with: rating
    fill_in :content, with: content
    fill_in :optional_picture, with: optional_picture

    click_on "Add New Review"

    expect(current_path).to eq("/shelters/#{shelter.id}")
    expect(page).to have_content(title)
    expect(page).to have_content(rating)
    expect(page).to have_content(content)
    expect(page).to have_css("img[src*='#{@new_review.optional_picture}']")
  end
end
