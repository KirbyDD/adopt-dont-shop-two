require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  before :each do
    @adams_county = Shelter.create(name: "Adams County",
                                   address: "1234 Colorado blvd.",
                                   city: "Denver",
                                   state: "Colorado",
                                   zip: 80230
                                 )
    @twitch = @adams_county.pets.create!(image:          'https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg',
                                         description:    'Cutie',
                                        name:           'Twitch',
                                        approximate_age: 5,
                                        sex:            'Male'
                                      )
    @jona = @adams_county.pets.create!(  image:          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLIxsIlLTscFOas_wsK_VgMOkZ6a8qBCTIJMSBY90VYOyXn08A&s',
                                        description:     'sassy',
                                        name:           'Jona',
                                        approximate_age: 6,
                                        sex:            'Female'
                                      )


  end
  it "can see all pets pictures, names, sexes and their shelter name" do

    visit "/pets"
    expect(page).to have_css("img[src*='#{@twitch.image}']")
    expect(page).to have_content("name: #{@twitch.name}")
    expect(page).to have_content("approximate_age: #{@twitch.approximate_age}")
    expect(page).to have_content("sex: #{@twitch.sex}")
    expect(page).to have_css("img[src*='#{@jona.image}']")
    expect(page).to have_content("name: #{@jona.name}")
    expect(page).to have_content("approximate_age: #{@jona.approximate_age}")
    expect(page).to have_content("sex: #{@jona.sex}")
  end

  it "can see all pets in the shelter's pictures, name, age and sex" do

    visit "/shelters/#{@adams_county.id}/pets"

    expect(page).to have_css("img[src*='#{@twitch.image}']")
    expect(page).to have_content("name: #{@twitch.name}")
    expect(page).to have_content("approximate_age: #{@twitch.approximate_age}")
    expect(page).to have_content("sex: #{@twitch.sex}")
    expect(page).to have_css("img[src*='#{@jona.image}']")
    expect(page).to have_content("name: #{@jona.name}")
    expect(page).to have_content("approximate_age: #{@jona.approximate_age}")
    expect(page).to have_content("sex: #{@jona.sex}")
  end
end
