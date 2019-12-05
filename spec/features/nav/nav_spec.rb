require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a page' do
    it 'will see persisting links' do

    visit '/pets'

    expect(current_path).to eq('/pets')

    click_link 'Shelters'

    expect(current_path).to eq('/shelters')

    visit '/shelters'

    expect(current_path).to eq('/shelters')

    click_link 'Pets'

    expect(current_path).to eq('/pets')
    #
    # visit '/pets'
    #
    # expect(current_path).to eq('/pets')
    #
    # click_on 'Favorites'
    #
    # expect(current_path).to eq('/favorites')
    end
  end
end
