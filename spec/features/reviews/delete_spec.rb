require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a review' do
    @new_shelter = Shelter.create(name: 'Denver Dumb Friends League',
                                  address: '1234 Colorado Blvd.',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: 80003)

    @new_review = @new_shelter.reviews.create(title: "GOOD!",
                                             rating: 5,
                                             content: "This shelter was GOOD!",
                                             optional_picture: "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg")

    visit "/shelters/#{@new_shelter.id}"

    click_link 'Delete This Review'

    expect(current_path).to eq("/shelters/#{@new_shelter.id}")
    expect(page).to_not have_content(@new_review.title)
    expect(page).to_not have_content(@new_review.rating)
    expect(page).to_not have_content(@new_review.content)
    expect(page).to_not have_content(@new_review.optional_picture)
  end
end
