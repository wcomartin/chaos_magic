class Player < ApplicationRecord
  belongs_to :game
  belongs_to :person
end
