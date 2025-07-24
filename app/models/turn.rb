class Turn < ApplicationRecord
  belongs_to :game
  belongs_to :card

  before_create :set_rolls

  private

  def set_rolls
    self.damage_roll ||= SecureRandom.random_number(0..9)
    self.chaos_roll ||= (SecureRandom.random_number(0..19) * 10) + SecureRandom.random_number(0..9)
  end
end
