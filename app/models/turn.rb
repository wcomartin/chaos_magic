class Turn < ApplicationRecord
  belongs_to :game
  belongs_to :card
end
