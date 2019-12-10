class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex, :description, :adoptable
  validates_inclusion_of :sex, in: ['male', 'female', 'Male', 'Female']

  belongs_to :shelter
	has_many :pet_applications
	has_many :applications, through: :pet_applications

  def self.count_of_pets
    count
  end

	def self.amount_of_apps
		amount = 0
		self.count do |pet|
			amount += pet.applications.count
		end
		amount
	end


  def self.pets_with_apps
    joins(:applications).uniq
  end
end
