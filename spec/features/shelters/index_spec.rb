require 'rails_helper'

RSpec.describe "Shelters index page", type: :feature do
  it "Can see all shelters name and address" do
    shelter_1 = Shelter.create(name:    "Friends with Paws",
                               address: "1234 Colorado st.",
                               city:    "Denver",
                               state:   "Colorado",
                               zip:     80004

    )
    shelter_2 = Shelter.create(name:    "Bleeding Heart Rescue",
                               address: "5678 3 rd.",
                               city:    "Arvada",
                               state:   "Colorado",
                               zip:     80233

    )

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)

    expect(page).to have_content(shelter_2.name)
    
  end
end
