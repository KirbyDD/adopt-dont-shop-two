require 'rails_helper'

RSpec.describe 'New Pet' do
  describe 'As a visitor' do
    describe 'When I visist the pets index' do
      it 'I can update a pets information' do
        adams_county = Shelter.create!(name: 'Adams County',
                                       address: '1234 Colorado blvd.',
                                       city: 'Denver',
                                       state: 'Colorado',
                                       zip: 80230
                                     )

        pet = adams_county.pets.create!(image:          'https://www.purina.com/sites/g/files/auxxlc196/files/styles/kraken_generic_max_width_360/public/seo-article-16-hero_2.jpg?itok=hTP9CrLN',
                          name:           'Twitch',
                          approximate_age: 5,
                          sex:             'Male',
                          description:     'Adorable',
                          adoptable:       true
                        )

        visit '/pets'

        click_link 'Edit'

        expect(current_path).to eq("/pets/#{pet.id}/edit")

        fill_in 'Image', with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQN5mry0B0UJ4mYpiRNF_MtZEZV6_UKUTnXGGX-Ne6lYHfzbZTRQ&s"
        fill_in 'Name', with: "Ozzy"
        fill_in 'approximate_age', with: 8
        fill_in 'Sex', with: "Male"
        fill_in 'Description', with: "Funny"
        click_on 'Update Pet Info.'


        expect(current_path).to eq("/pets/#{pet.id}")
        expect(page).to have_content('Ozzy')
        expect(page).to have_content(8)
        expect(page).to have_content("Male")
        expect(page).to have_content("Funny")
        
      end
    end
  end
end
