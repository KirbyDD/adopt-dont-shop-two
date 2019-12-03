require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a pet show page' do
    it 'only see that pets image and name' do
      adams_county = Shelter.create!(name: 'Adams County',
                                     address: '1234 Colorado blvd.',
                                     city: 'Denver',
                                     state: 'Colorado',
                                     zip: 80230
      )
      twitch = adams_county.pets.create(image:           'https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg',
                                        name:            'Twitch',
                                        description:     'Black and Brown colored classic Doxin',
                                        approximate_age:  5,
                                        sex:              'Male',
                                        adoptable:       'Yes'
                                      )
      jona = adams_county.pets.create( image:            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLIxsIlLTscFOas_wsK_VgMOkZ6a8qBCTIJMSBY90VYOyXn08A&s',
                                        name:            'Jona',
                                        description:     'Black long haird shepard, herding dog',
                                        approximate_age:  6,
                                        sex:             'Female',
                                        adoptable:      'No'
                                      )


      visit "/pets/#{twitch.id}"

      expect(page).to have_css("img[src*='#{twitch.image}']")
      expect(page).to have_content(twitch.name)
      expect(page).to have_content(twitch.description)
      expect(page).to have_content(twitch.approximate_age)
      expect(page).to have_content(twitch.sex)
      expect(page).to have_content(twitch.adoptable)

      expect(page).to_not have_content(jona.name)
      expect(page).to_not have_content(jona.description)
      expect(page).to_not have_content("approximate_age: 6")
      expect(page).to_not have_content(jona.sex)
    end
  end
end
