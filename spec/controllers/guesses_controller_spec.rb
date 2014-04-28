require 'spec_helper'

describe GuessesController do
  render_views

  describe "#create" do
    let(:game) {games(:game1)}

    it "creates a new game" do
      expect { 
        post :create, :game_id => game.id , :guess => {:first_color => "1", :second_color => "2" , :third_color => "3" , :fourth_color => "5" }
      }.to change { game.guesses.count }.by(1)

      expect(response).to redirect_to(game_path(game))
    end
  end
end
