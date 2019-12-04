require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'I visit a shelter show page' do
    before(:each) do
      @new_shelter = Shelter.create(name: 'Denver Dumb Friends League',
      address: '1234 Colorado Blvd.', city: 'Denver', state: 'Colorado',
      zip: 80003)
    end
    it "Then I see only the shelters name and full address" do
      
      
      visit "/shelters/#{@new_shelter.id}"
      
      expect(page).to have_content(@new_shelter.name)
      expect(page).to have_content(@new_shelter.address)
      expect(page).to have_content(@new_shelter.city)
      expect(page).to have_content(@new_shelter.state)
      expect(page).to have_content(@new_shelter.zip)
    end
        
    it 'will show reviews for shelters' do
      new_review = @new_shelter.reviews.create(title: "GOOD!",
      rating: 5, content: "This shelter was GOOD!", optional_picture: "https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg")

      new_review_2 = @new_shelter.reviews.create(title: "Great!",
      rating: 3, content: "This shelter was Great!")
     
      visit "/shelters/#{@new_shelter.id}"

      expect(page).to have_content(new_review.title)
      expect(page).to have_content(new_review.rating)
      expect(page).to have_content(new_review.content)
      expect(page).to have_css("img[src*='#{new_review.optional_picture}']")
      
      expect(page).to have_content(new_review_2.title)
      expect(page).to have_content(new_review_2.rating)
      expect(page).to have_content(new_review_2.content)
    end    
  end
end
