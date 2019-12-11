require 'rails_helper'
RSpec.describe 'As a visitor' do
  describe 'when I visit pets index page' do 
    it 'I can delete a pet' do
      adams_county = Shelter.create(name: 'Denver Dumb Friends League',
                                    address: '1234 Colorado Blvd.',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    zip: 80023
                                  )
      pet = adams_county.pets.create(image: "https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg",
                                    name: 'Twitch',
                                    approximate_age: 5,
                                    sex: 'Male',
                                    description: 'Small Black and Brown doxin',
                                    adoptable: 'yes'
                                  )

      visit '/pets'

      click_link 'Delete'

      expect(current_path).to eq('/pets')
      expect(page).to_not have_content(pet.image)
      expect(page).to_not have_content(pet.name)
      expect(page).to_not have_content(pet.approximate_age)
      expect(page).to_not have_content(pet.sex)
      expect(page).to_not have_content(pet.description)
    end
    it 'can delete favorited pets from page and favorites' do
         adams_county = Shelter.create(name: 'Denver Dumb Friends League',
                                    address: '1234 Colorado Blvd.',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    zip: 80023
                                  )
      pet = adams_county.pets.create(image: "https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg",
                                    name: 'Twitch',
                                    approximate_age: 5,
                                    sex: 'Male',
                                    description: 'Small Black and Brown doxin',
                                    adoptable: 'yes'
                                  )
      visit '/pets'

      click_button 'Favorite'

      click_link 'Delete'

      visit '/favorites'

      expect(page).to_not have_content(pet.image)
      expect(page).to_not have_content(pet.name)

    end
    # it 'flash pet is pending when pet has applicaitons' do
    #      adams_county = Shelter.create(name: 'Denver Dumb Friends League',
    #                                 address: '1234 Colorado Blvd.',
    #                                 city: 'Denver',
    #                                 state: 'Colorado',
    #                                 zip: 80023
    #                               )
    #      pet = adams_county.pets.create(image: "https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg",
    #                                 name: 'Twitch',
    #                                 approximate_age: 5,
    #                                 sex: 'Male',
    #                                 description: 'Small Black and Brown doxin',
    #                                 adoptable: 'yes'
    #                               )
    #     ray = Application.create(name: "Ray Nguyen", address: "123 Fake st.", city: "Denver", state: "Colorado", zip: 80230, phone_number: "1234567890", why_would_you_make_a_good_pet_owner: "Because why not")

    #     PetApplication.create(pet: pet, application: ray)  
        
    #     visit '/pets'

    #     click_link 'Delete'

    #     expect(page).to have_content('pending')

    # end
  end
end
