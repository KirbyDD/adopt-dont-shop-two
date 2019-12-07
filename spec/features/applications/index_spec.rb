require 'rails_helper'

RSpec.describe "The application index page" do
	it "should display all applications" do
		@sebastian = Application.create!(name: "Sebastian Sloan",
																								 address: "123 Fake st.",
																							   city: "Denver",
																							 	 state: "Colorado",
																							 	 zip: 80230,
																							 	 phone_number: 123 456 7890,
																							 	 why_would_you_make_a_good_pet_owner: "Because why not"
																							 )

		@demarcus = Application.create!( name: "DeMarcus Kirby",
																								 address: "123 Fake st.",
																							   city: "Denver",
																							 	 state: "Colorado",
																							 	 zip: 80230,
																							 	 phone_number: 123 456 7890,
																							 	 why_would_you_make_a_good_pet_owner: "Because why not"
																							 )

		@ray = Application.create!(			 name: "Ray Nugyen",
																								 address: "123 Fake st.",
																							   city: "Denver",
																							 	 state: "Colorado",
																							 	 zip: 80230,
																							 	 phone_number: 123 456 7890,
																							 	 why_would_you_make_a_good_pet_owner: "Because why not"
																							 )

		@adams_county = Shelter.create!(name: "Adams County Shelter",
																		address: "6789 Colorado blvd.",
																		city: "Denver",
																		state: "Colorado",
																		zip: 80230
																	)
		@ddfl = Shelter.create!(name: "Denver Dumb Friends League",
																		address: "2345 Rails rd.",
																		city: "Boulder",
																		state: "Colorado",
																		zip: 80003
																	)
		@arvada_pets = Shelter.create!(name: "Arvada Pet Hospital",
																		address: "4563 Rake st.",
																		city: "Arvada",
																		state: "Colorado",
																		zip: 80005
																	)
		@twitch = @adams_county.pets.create!(image: "https://i.pinimg.com/originals/6e/3c/c1/6e3cc15c678002f4ece659442ae9aefd.jpg",
																				 name: "Twitch",
																			 	 approximate_age: 5,
																			 	 sex: "male",
																			 	 description: "wiener dog"
																			 	 )
		@maggie = @adams_county.pets.create!(image: "https://images-na.ssl-images-amazon.com/images/I/71PK2Z3fe5L.jpg",
																				 name: "Maggie",
																				 approximate_age: 12,
																				 sex: "female",
																				 description: "black lab"
																				 )
		@jona = @ddfl.pets.create!(					 image: "https://www.allthingsdogs.com/wp-content/uploads/2018/08/How-to-Care-for-a-Black-German-Shepherd.jpg",
																				 name: "Jona",
																			 	 approximate_age: 9,
																			 	 sex: "female",
																			 	 description: "black shepard"
																			 	 )
		@ozzy = @arvada_pets.pets.create!(	 image: "https://www.yourpurebredpuppy.com/dogbreeds/photos2-G/german-shepherd-05.jpg",
																				 name: "Ozzy",
																			 	 approximate_age: 3,
																			 	 sex: "male",
																			 	 description: "german shepard"
																			 	 )
		@ciri = @arvada_pets.pets.create!(	 image: "https://i.pinimg.com/originals/55/a1/0d/55a10d99c6953c93f00e0f747a8b109c.jpg",
																				 name: "Ciri",
																			 	 approximate_age: 3,
																			 	 sex: "female",
																			 	 description: "white lab"
																			 	 )

		@sebastian.pets << @jona
		@ray.pets << @twitch
		@ray.pets.push(@ciri)

		visit '/applications'

		within("#application-#{@sebastian.id}") do
			expect(page).to have_content(@sebastian.name)

			within("#pet-#{@ciri.id}") do
				edxpect(page).to have_content(@ciri.name)
			end

			within("#pet-#{@ozzy.id}") do
				expect(page).to have_content(@ozzy.name)
			end

			within("#pet-#{@jona.id}") do
				expect(page).to have_content(@jona.name)
			end
		end

		within("#application-#{@ray.id}") do
			expect(page).to have_content(@ray.name)

			within("#pet-#{@twitch.id}") do
				expect(page).to have_content(@twitch.name)
			end
		end

		within("#application-#{@ray.id}") do
			expect(page).to have_content(@ray.name)

			within("#pet-#{@twitch.id}") do
				expect(page).to have_content(@twitch.name)
			end

			within("#pet-#{@ciri.id}") do
				expect(page).to have_content(@ciri.name)
			end
		end
	end
end
