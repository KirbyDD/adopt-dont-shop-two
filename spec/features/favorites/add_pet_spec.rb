require 'rails_helper'

RSpec.describe 'When a user adds pet to their favorites' do

	before(:each) do
		@new_shelter = Shelter.create(name: 'Whatever',
																 address: '123 Fake st.',
															 	 city: 'Denver',
															 	 state: 'Colorado',
															 	 zip: 69696)
		@new_pet = @new_shelter.pets.create(image: 'meh',
																			name: 'Twitch',
																			approximate_age: 5,
																			sex: 'Male',
																			description: 'Cutie doggie',
																			)
		@new_pet_2 = @new_shelter.pets.create(image: 'meh',
																			name: 'Twitch',
																			approximate_age: 5,
																			sex: 'Male',
																			description: 'Cutie doggie',
																			)

	end

	it 'Displays a message' do

		visit '/pets'

		within("#pet-#{@new_pet.id}") do

			click_button 'Add Pet'
		end

		expect(page).to have_content("You have added #{@new_pet.name} to your favorites.")
	end

	it "Denies adding pet multiple times " do
		visit '/pets'

		within("#pet-#{@new_pet.id}") do

			click_button 'Add Pet'
		end

		within("#pet-#{@new_pet_2.id}") do

			click_button 'Add Pet'
		end

		within("#pet-#{@new_pet.id}") do

			click_button 'Add Pet'
		end

		expect(page).to have_content("You have already added #{@new_pet.name} in your favorites.")
		
	end
end
