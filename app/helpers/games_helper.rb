module GamesHelper
  def roll_damage
    SecureRandom.random_number(0..9)
  end

  def roll_chaos
    (SecureRandom.random_number(0..19) * 10) + SecureRandom.random_number(0..9)
  end
end
