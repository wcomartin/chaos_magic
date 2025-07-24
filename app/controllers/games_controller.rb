class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @card = Card.order("RANDOM()").first
    @damage_roll = SecureRandom.random_number(0..9)
    @chaos_roll = (SecureRandom.random_number(0..19) * 10) + SecureRandom.random_number(0..9)
  end

  def new
    @game = Game.new
    @people = Person.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: "Game was successfully created."
    else
      @people = Person.all # Re-fetch people for form if save fails
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(person_ids: [])
  end
end
