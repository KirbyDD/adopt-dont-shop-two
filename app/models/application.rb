class Application < ApplicationRecord
	validates_presence_of :name, :address, :city, :state, :zip, :phone_number, :why_would_you_make_a_good_pet_owner

	has_many :pet_applications
	has_many :pets, through: :pet_applications
end
