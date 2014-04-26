class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game].permit(:user,:number_of_guesess))
    if @game.save
      redirect_to @game
    else
      render 'index'
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
