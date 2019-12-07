class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex, :description, :adoptable
  validates_inclusion_of :sex, in: ['male', 'female', 'Male', 'Female']

  belongs_to :shelter
	has_many :pet_applications
	has_many :applications, through: :pet_applications 

  def self.count_of_pets
    count
  end
end
