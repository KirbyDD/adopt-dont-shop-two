require 'rails_helper'
RSpec.describe 'As a visitor' do
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
                                   adoptable: true
                                 )

   visit '/pets'

   click_link 'Delete'

   expect(current_path).to eq('/pets')
   expect(page).to_not have_content(pet.image)
   expect(page).to_not have_content(pet.name)
   expect(page).to_not have_content(pet.approximate_age)
   expect(page).to_not have_content(pet.sex)
   expect(page).to_not have_content(pet.description)
   expect(page).to_not have_content(pet.adoptable)
 end
end
