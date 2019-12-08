require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a pet show page' do
    it 'only see that pets image and name' do
      @adams_county = Shelter.create!(name: 'Adams County',
                                     address: '1234 Colorado blvd.',
                                     city: 'Denver',
                                     state: 'Colorado',
                                     zip: 80230
      )
      @twitch = adams_county.pets.create(image:           'https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg',
                                        name:            'Twitch',
                                        description:     'Black and Brown colored classic Doxin',
                                        approximate_age:  5,
                                        sex:              'Male',
                                        adoptable:       'Yes'
                                      )
      @jona = adams_county.pets.create( image:            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLIxsIlLTscFOas_wsK_VgMOkZ6a8qBCTIJMSBY90VYOyXn08A&s',
                                        name:            'Jona',
                                        description:     'Black long haird shepard, herding dog',
                                        approximate_age:  6,
                                        sex:             'Female',
                                        adoptable:      'No'
                                      )


      visit "/pets/#{@twitch.id}"

      expect(page).to have_css("img[src*='#{twitch.image}']")
      expect(page).to have_content(@twitch.name)
      expect(page).to have_content(@twitch.description)
      expect(page).to have_content(@twitch.approximate_age)
      expect(page).to have_content(@twitch.sex)
      expect(page).to have_content(@twitch.adoptable)

      expect(page).to_not have_content(@jona.name)
      expect(page).to_not have_content(@jona.description)
      expect(page).to_not have_content("approximate_age: 6")
      expect(page).to_not have_content(@jona.sex)
    end

		it "I see a link to view the applications on this pet" do
			@sebastian = Application.create!(name: "Sebastian Sloan",
																									 address: "123 Fake st.",
																									 city: "Denver",
																									 state: "Colorado",
																									 zip: 80230,
																									 phone_number: "1234567890",
																									 why_would_you_make_a_good_pet_owner: "Because why not"
																								 )
			@ddfl = Shelter.create!(name: "Denver Dumb Friends League",
																			address: "2345 Rails rd.",
																			city: "Boulder",
																			state: "Colorado",
																			zip: 80003
																		)
			@jona = @ddfl.pets.create!(					 image: "https://www.allthingsdogs.com/wp-content/uploads/2018/08/How-to-Care-for-a-Black-German-Shepherd.jpg",
																						name: "Jona",
																						approximate_age: 9,
																						sex: "female",
																						description: "black shepard"
																						)

			visit "/pets/#{@jona.id}"

			click_link "Current Applications"

			expect(current_path).to eq("/applications/#{@twitch.id}")
		end
  end
end
