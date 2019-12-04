
require 'rails_helper'

RSpec.describe "creating a new pet" do
  it "can create a pet" do
    shelter = Shelter.create!(name: "Adams County",
                              address: "1234 Colorado blvd.",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80230
                            )

    image = "https://dachshundjournal.com/wp-content/uploads/2018/07/dachshund-1519374_1280-900x681.jpg"
    name = 'Twitch'
    approximate_age = 5
    sex = 'Male'
    description = "Small Black and Brown doxin"


    visit "/shelters/#{shelter.id}/pets/new"

    fill_in "Image", with: image
    fill_in :name, with: name
    fill_in :approximate_age, with: approximate_age
    fill_in :sex, with: sex
    fill_in :description, with: description


    click_on "Add New Adoptable Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{shelter.id}/pets")
    expect(page).to have_css("img[src*='#{new_pet.image}']")
    expect(page).to have_content(name)
    expect(page).to have_content(approximate_age)
    expect(page).to have_content(sex)

  end
end
