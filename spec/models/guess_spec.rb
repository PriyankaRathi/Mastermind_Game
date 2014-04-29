require 'spec_helper'

describe Guess do
  describe "#find_guessed_number" do
    let(:guess) {guesses(:guess_a)}
    subject {guess.find_guessed_number}

    it { expect(subject).to eq "2221"}
  end

  describe "#find_correct_digits_index" do
    let(:guess) {guesses(:guess_a)}
    subject {guess.find_correct_digits_index}

    it { expect(subject).to eq [1]}
  end

  describe "#find_correct_digits_count" do
    let(:guess) {guesses(:guess_a)}
    subject {guess.find_correct_digits_count}

    it { expect(subject).to eq 1}
  end
  
  describe "#find_correct_at_wrong_postion_digit_count" do
    let(:guess) {guesses(:guess_a)}
    before { guess.find_correct_digits_count }
    subject {guess.find_correct_at_wrong_postion_digit_count}

    it { expect(subject).to eq 1}
  end

end
