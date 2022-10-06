class Trinket < ApplicationRecord
  belongs_to :fish
  has_many :members
end
