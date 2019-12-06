class Review < ApplicationRecord
    validates_presence_of :title, :rating, :content
    validates_inclusion_of :rating, in: [1, 2, 3, 4, 5]

    belongs_to :shelter
end