class Shelter < ApplicationRecord
   validates_presence_of :name, :address, :state, :city, :zip

   has_many :pets, dependent: :delete_all
   has_many :reviews, dependent: :delete_all
end
# hello
