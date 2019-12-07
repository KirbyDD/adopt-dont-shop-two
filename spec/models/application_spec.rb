require 'rails_helper'

RSpec.descirbe Application, type: :model do
	describe "relationships" do
		it { should have_many :pet_applications}
	end
end
