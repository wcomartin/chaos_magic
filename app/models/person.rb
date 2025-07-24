class Person < ApplicationRecord
  has_many :players
  has_many :games, through: :players
end
