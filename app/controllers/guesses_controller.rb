class GuessesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    @guess = game.guesses.build(params[:guess].permit(:first_color, :second_color, :third_color, :fourth_color))

    flash[:error] = @guess.errors.full_messages.to_sentence unless game.save
    redirect_to game  
  end
end
