require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
    describe 'I visit a shelter show page' do
        it 'I can update a pets information' do
            new_shelter = Shelter.create(name: 'PetsMart', 
                                          address: '123 Fake St.',
                                          city: 'Gotham',
                                          state: 'Califorina',
                                          zip: 90120)
            new_review = @new_shelter.reviews.create(title: "Awesome!", rating: 5, content: "This place gave me my best friend.")

            visit '/shelters'

            click_link 'Edit'

            expect(current_path).to eq("/shelters/#{new_review.id}/edit")

            fill_in :title, with: 'PetsCo'
            fill_in :rating, with: 2
            fill_in :content, with: "Nevermind"

            click_on 'Update Pet Info.'

            expect(current_path).to eq("/shelters/#{new_review.id}")
            expect(page).to have_content('PetsCo')
            expect(page).to have_content(2)
            expect(page).to have_content("Nevermind")
        end  
    end
end