require 'spec_helper'

describe Game do
  describe "#won?"  do
    subject {game.won?}

    context "when entered incorrect guess" do
      let(:game) {games(:game1)}
      it {expect(subject).to be false}
    end
    
    context "when entered correct guess" do
      let(:game) {games(:game2)}
      it {expect(subject).to be true}
    end
  end

  describe "#find_latest_guess" do 
    let(:game) {games(:game1)}
    let (:guess) {guesses(:guess_b)}
    subject {game.find_latest_guess}

    it "should return last guess" do
      expect(subject).to eq guess
    end
  end

  describe "#lost??" do
    subject {game.lost?}
    context "When not out of guesses" do
      let(:game) {games(:game1)}
      it {expect(subject).to be false}
    end

    context "When out of guesses" do
      let(:game) {games(:game3)}
      it {expect(subject).to be true}
    end
  end

  describe "#guesses_left" do
    subject {game.guesses_left}
    let(:game) {games(:game2)}

    it {expect(subject).to eq 2}
  end

  describe "#pick_target_guess_number" do
    before {game.target_guess_number = ""}
    subject {game.pick_target_guess_number}
    let(:game) {games(:game2)}

    it "should return numeric string of length #{Game::NO_OF_COLORS_IN_GAME}" do
      expect(subject.length) == Game::NO_OF_COLORS_IN_GAME
      expect( is_valid_number?(subject) ).to be true
    end
    
    context "when duplicates not allowed" do
      let(:game) {games(:game1)}
      it{ expect( is_duplicate?(subject) ).to be true}
    end
  end
end