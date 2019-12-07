require 'rails_helper'

RSpec.describe "As a Visitor" do 
  it "Shows all favorited pets" do 
    adams_county = Shelter.create(name: "Adams County",
                                   address: "1234 Colorado blvd.",
                                   city: "Denver",
                                   state: "Colorado",
                                   zip: 80230
                                 )
    twitch = adams_county.pets.create!(image:          'https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg',
                                         description:    'Cutie',
                                        name:           'Twitch',
                                        approximate_age: 5,
                                        sex:            'Male'
                                      )
    
    jona = adams_county.pets.create!(  image:          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLIxsIlLTscFOas_wsK_VgMOkZ6a8qBCTIJMSBY90VYOyXn08A&s',
      description:     'sassy',
      name:           'Jona',
      approximate_age: 6,
      sex:            'Female'
    )

    visit "/shelters/#{adams_county.id}/pets"

    within("#pet-#{twitch.id}") do
      click_on "Favorite"
    end

    within("#pet-#{jona.id}") do
      click_on "Favorite"
    end

    visit '/favorites'

    expect(page).to have_content(twitch.name)
    expect(page).to have_css("img[src*='#{twitch.image}']")
    expect(page).to have_content(jona.name)
    expect(page).to have_css("img[src*='#{jona.image}']")

    within("#pet-#{twitch.id}") do
      click_on "Unfavorite Pet"
    end
    
    expect(current_path).to eq("/favorites")

    expect(page).to_not have_content(twitch.name)
    expect(page).to_not have_css("img[src*='#{twitch.image}']")
    expect(page).to have_content(jona.name)
    expect(page).to have_css("img[src*='#{jona.image}']")
    
    within("#pet-#{jona.id}") do
      click_on "Unfavorite Pet"
    end



  end
end