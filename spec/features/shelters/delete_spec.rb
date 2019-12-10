require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a shelter' do
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
                                 adoptable: 'pending'
                               )

    visit "/shelters/#{adams_county.id}"

    click_link 'Delete'

    expect(current_path).to eq("/shelters/#{adams_county.id}")
    expect(page).to have_content("Shelter not deleted: Shelter has pet currently approved for adoption.")
    expect(page).to have_content(adams_county.name)
    expect(page).to have_content(adams_county.address)
    expect(page).to have_content(adams_county.city)
    expect(page).to have_content(adams_county.state)
    expect(page).to have_content(adams_county.zip)
    expect(page).to have_link('Delete')

    pet.adoptable = 'yes'
    pet.update({adoptable: 'yes'})

    click_link 'Delete'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(adams_county.name)
    expect(page).to_not have_content(adams_county.address)
    expect(page).to_not have_content(adams_county.city)
    expect(page).to_not have_content(adams_county.state)
    expect(page).to_not have_content(adams_county.zip)
    expect(page).to_not have_button('Delete')
  end
end
