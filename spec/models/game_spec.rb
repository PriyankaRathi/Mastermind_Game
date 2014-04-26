require 'spec_helper'

describe Game do
  let(:game) {games(:game1)}

  describe "#won?"  do
    subject {game.won?}

    context "when entered incorrect guess" do
      let(:guess) {guesses(:guess_a)}
      it {expect(subject).to be false}
    end
    
    context "when entered correct guess" do
      let(:guess) {guesses(:guess_b)}
      it {expect(subject).to be true}
    end
  end

  describe "#find_latest_guess" do 
    let (:guess) {guesses(:guess_a)}
    subject {game.find_latest_guess}

    it "should return last guess" do
      expect(subject).to eq guess
    end
  end
end