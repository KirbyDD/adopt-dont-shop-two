require 'rails_helper'

RSpec.describe 'On the favorites page' do
   describe 'as a visitor' do
        before(:each) do
            @adams_county = Shelter.create(name:     "Adams County",
                                        address:  "1234 Colorado blvd.",
                                        city:     "Denver",
                                        state:    "Colorado",
                                        zip:       80230
                                        )
            @twitch = @adams_county.pets.create!(image:          'https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg',
                                                description:    'Cutie',
                                                name:           'Twitch',
                                                approximate_age: 5,
                                                sex:             'Male'
                                                )
            @jona = @adams_county.pets.create!(image:          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLIxsIlLTscFOas_wsK_VgMOkZ6a8qBCTIJMSBY90VYOyXn08A&s',
                                                description:     'sassy',
                                                name:           'Jona',
                                                approximate_age: 6,
                                                sex:            'Female'
                                                )
            @dino = @adams_county.pets.create!(image:          'https://www.stripes.com/polopoly_fs/1.507122.1516212932!/image/image.jpg_gen/derivatives/landscape_900/image.jpg',
                                                description:     'dinosaur coolness',
                                                name:           'Dino',
                                                approximate_age: 2,
                                                sex:            'Female'
                                                )
        end
        it 'can fill in application' do

            visit "/shelters/#{@adams_county.id}/pets"

            within("#pet-#{@twitch.id}") do
               click_on "Favorite"
            end

            within("#pet-#{@jona.id}") do
               click_on "Favorite"
            end

            within("#pet-#{@dino.id}") do
               click_on "Favorite"
            end

            visit '/favorites'

            click_on 'Apply for Pets'

            expect(current_path).to eq("/applications/new")

            check(@twitch.name)
            check(@jona.name)

            fill_in :name, with: 'Ray'
            fill_in :address, with: '123 Fake St.'
            fill_in :city, with: 'Denver'
            fill_in :state, with: 'Colorado'
            fill_in :zip, with: 80014
            fill_in :phone_number, with: '3035551234'
            fill_in :why_would_you_make_a_good_pet_owner, with: 'I have money'

            click_on 'Apply'

            expect(current_path).to eq('/favorites')
            expect(page).to_not have_content(@twitch.image)
            expect(page).to_not have_content(@jona.image)
            expect(page).to have_content(@dino.name)

            expect(page).to have_content("Application sent for: #{@twitch.name}")
            expect(page).to have_content("Application sent for: #{@jona.name}")


            new_application = Application.last


            visit '/applications'

            expect(current_path).to eq("/applications")
            expect(page).to have_content(new_application.name)
            expect(page).to have_content(new_application.address)
            expect(page).to have_content(new_application.city)
            expect(page).to have_content(new_application.state)
            expect(page).to have_content(new_application.zip)
            expect(page).to have_content(new_application.phone_number)
            expect(page).to have_content(new_application.why_would_you_make_a_good_pet_owner)

        end
        it 'can flash error message when field in form is not filled' do

            visit "/shelters/#{@adams_county.id}/pets"

            within("#pet-#{@twitch.id}") do
               click_on "Favorite"
            end

            within("#pet-#{@jona.id}") do
               click_on "Favorite"
            end

            within("#pet-#{@dino.id}") do
               click_on "Favorite"
            end

           visit '/favorites'

           click_on 'Apply for Pets'
            
           expect(current_path).to eq("/applications/new")

           fill_in :name, with: 'Ray'
           fill_in :address, with: '123 Fake St.'
           fill_in :city, with: 'Denver'
           fill_in :state, with: 'Colorado'

           click_on 'Apply'

           expect(page).to have_content('Application not created: Required information missing.')
           expect(current_path).to eq("/applications/new")
           expect(page).to have_button('Add New Review')
        end
    end
end
