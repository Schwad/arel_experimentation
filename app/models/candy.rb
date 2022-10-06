class Candy < ApplicationRecord
  has_many :fish_candies
  has_many :fish, through: :fish_candies
end
