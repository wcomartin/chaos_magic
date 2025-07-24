class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    last_turn = @game.turns.last
    @card = last_turn&.card || Card.order("RANDOM()").first
    @damage_roll = last_turn&.damage_roll || 0
    @chaos_roll = last_turn&.chaos_roll || 0
  end

  def new
    @game = Game.new
    @people = Person.all
  end

  def next_turn
    @game = Game.find(params[:id])
    @card = Card.order("RANDOM()").first

    new_turn = @game.turns.create!(card: @card)
    @damage_roll = new_turn.damage_roll
    @chaos_roll = new_turn.chaos_roll

    respond_to do |format|
      format.turbo_stream
    end
  end

  def history
    @game = Game.find(params[:id])
    @turns = @game.turns.order(created_at: :desc)
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
