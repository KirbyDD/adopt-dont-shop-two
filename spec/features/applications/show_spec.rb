require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit an application show page' do
    before(:each) do 
        
        @ddfl = Shelter.create!(name: "Denver Dumb Friends League",
            address: "2345 Rails rd.",
            city: "Boulder",
            state: "Colorado",
            zip: 80003
        )
        @adams_county = Shelter.create!(name: 'Adams County',
            address: '1234 Colorado blvd.',
            city: 'Denver',
            state: 'Colorado',
            zip: 80230
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
        @sebastian = @jona.applications.create!(name: "Sebastian Sloan",
            address: "123 Fake st.",
            city: "Denver",
            state: "Colorado",
            zip: 80230,
            phone_number: "1234567890",
            why_would_you_make_a_good_pet_owner: "Because why not"
        )
        
        @demarcus = @twitch.applications.create!(name: "DeMarcus Kirby",
            address: "123 Fake st.",
            city: "Denver",
            state: "Colorado",
            zip: 80230,
            phone_number: "1234567890",
            why_would_you_make_a_good_pet_owner: "Because why not"
        )
        
        @ray = @twitch.applications.create!(name: "Ray Nugyen",
            address: "123 Fake st.",
            city: "Denver",
            state: "Colorado",
            zip: 80230,
            phone_number: "1234567890",
            why_would_you_make_a_good_pet_owner: "Because why not"
        )
    end
    
    it 'only see that application information' do
    
        visit "/applications/#{@ray.id}"
    
        expect(current_path).to eq("/applications/#{@ray.id}")
        expect(page).to have_content(@ray.name)
        expect(page).to have_content(@ray.address)
        expect(page).to have_content(@ray.city)
        expect(page).to have_content(@ray.state)
        expect(page).to have_content(@ray.zip)
        expect(page).to have_content(@ray.phone_number)
        expect(page).to have_content(@ray.why_would_you_make_a_good_pet_owner)
    end
  end
end
