require 'rails_helper'

RSpec.describe 'New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the shelters index' do
      it 'I can update a shelter' do
        pet_shelter = Shelter.create(name: 'Pet Shelter', address: '34565 Funville rd.',
                                     city: 'Louisville', state: 'Washington', zip: 78436)

        visit '/shelters'

        click_link 'Edit'

        expect(current_path).to eq("/shelters/#{pet_shelter.id}/edit")

        fill_in 'Name', with: 'New Pet Shelter'
        fill_in 'Address', with: '34565 Funville rd.'
        fill_in 'City', with: 'Louisville'
        fill_in 'State', with: 'Washington'
        fill_in 'Zip', with: 78436
        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters")
        expect(page).to have_content('New Pet Shelter')
        expect(page).to have_content('34565 Funville rd.')
        expect(page).to have_content('Louisville')
        expect(page).to have_content('Washington')
        expect(page).to have_content(78436)
      end

			it "can flash error message if shelter field is incomplete" do
				pet_shelter = Shelter.create(name: 'Pet Shelter', address: '34565 Funville rd.',
					city: 'Louisville', state: 'Washington', zip: 78436)

				visit '/shelters'

				click_link 'Edit'

				expect(current_path).to eq("/shelters/#{pet_shelter.id}/edit")

				fill_in 'Name', with: 'New Pet Shelter'

				click_on 'Update Shelter'

				expect(page).to have_content("Shelter not updated: Required information missing.")
				expect(current_path).to eq("/shelters/#{pet_shelter.id}/edit")
				expect(page).to have_button("Update Shelter")
			end


    end
  end
end
