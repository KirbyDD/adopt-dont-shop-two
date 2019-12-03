require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a shelter' do
    adams_county = Shelter.create(name: 'Denver Dumb Friends League',
                                   address: '1234 Colorado Blvd.',
                                   city: 'Denver',
                                   state: 'Colorado',
                                   zip: 80023
                                 )

    visit '/shelters'

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
