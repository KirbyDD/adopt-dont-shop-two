require 'rails_helper'

RSpec.describe 'As a Visitor', type: :feature do
  describe 'I visit a shelter show page' do
    it "Then I see only the shelters name and full address" do
      new_shelter = Shelter.create(name: 'Denver Dumb Friends League',
      address: '1234 Colorado Blvd.', city: 'Denver', state: 'Colorado',
    zip: 80003)

      visit "/shelters"

      expect(page).to have_content(new_shelter.name)
      expect(page).to have_content(new_shelter.address)
      expect(page).to have_content(new_shelter.city)
      expect(page).to have_content(new_shelter.state)
      expect(page).to have_content(new_shelter.zip)
    end
  end
end
