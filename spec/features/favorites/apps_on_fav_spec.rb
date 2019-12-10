require 'rails_helper'

RSpec.describe "As a visitor" do
  it 'Should Show pets with applications' do
    @adams_county = Shelter.create!(name: "Adams County Shelter",
																		address: "6789 Colorado blvd.",
																		city: "Denver",
																		state: "Colorado",
																		zip: 80230
																	)
		@twitch = @adams_county.pets.create!(image: "https://i.pinimg.com/originals/6e/3c/c1/6e3cc15c678002f4ece659442ae9aefd.jpg",
																				name: "Twitch",
																				approximate_age: 5,
																				sex: "male",
																				description: "wiener dog"
																				)
		visit "/shelters/#{@adams_county.id}/pets"

		within("#pet-#{@twitch.id}") do
			click_on "Favorite"
		end

		visit "/favorites"
		expect(page).to have_content "#{@twitch.name}"
		
		click_on 'Apply for Pets'

		check("pet-#{@twitch.name}")

		fill_in :name, with: 'Ray'
		fill_in :address, with: '123 Fake St.'
		fill_in :city, with: 'Denver'
		fill_in :state, with: 'Colorado'
		fill_in :zip, with: 80014
		fill_in :phone_number, with: '3035551234'
		fill_in :why_would_you_make_a_good_pet_owner, with: 'I have money'

		click_on 'Apply'

		within("#app-#{@twitch.id}") do
			expect(page).to have_content "#{@twitch.name}"
			click_on "#{@twitch.name}"
		 end
		 expect(current_path).to eq("/pets/#{@twitch.id}")
  end
end