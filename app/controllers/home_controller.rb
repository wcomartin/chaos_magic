class HomeController < ApplicationController
  def index
    @damage_roll = SecureRandom.random_number(0..9)
    @chaos_roll = (SecureRandom.random_number(0..19) * 10) + SecureRandom.random_number(0..9)
  end
end
