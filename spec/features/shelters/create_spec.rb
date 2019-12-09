require 'rails_helper'

RSpec.describe 'New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the new shelter form by clicking a link
on the index' do
  it 'I can create a new shelter' do
    visit '/shelters'

      click_link 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in 'Name', with: 'Denver Dumb Friends League'
      fill_in 'Address', with: '1234 Colorado Blvd.'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'Colorado'
      fill_in 'zip', with: 80003
      click_on 'Create Shelter'

      expect(current_path).to eq("/shelters")
      expect(page).to have_content('Denver Dumb Friends League')

      end

	it "Can flash error message if form is incomplete" do

			visit '/shelters'

			click_link 'New Shelter'

			expect(current_path).to eq('/shelters/new')

			fill_in 'Name', with: 'Denver Dumb Friends League'

			click_on "Create Shelter"

			expect(page).to have_content("Shelter not created: Required information missing.")
			expect(current_path).to eq("/shelters/new")
			expect(page).to have_button("Create Shelter")
			end
    end
  end
end
