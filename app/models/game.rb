class Game < ActiveRecord::Base
  has_many :guesses

  before_validation :pick_target_guess_number

  validates :user, :number_of_guesess, :target_guess_number , :presence => true
  validates :target_guess_number, :format => {:with => /\A[1-5]{4}\Z/}
  #validates :allow_duplicates :format => {:with => /[0,1]/}

  def pick_target_guess_number
    guess_num = ""
    4.times do 
      guess_num << rand(1..5).to_s
    end
    self.target_guess_number ||= guess_num
  end

  def find_latest_guess
    guesses.last
  end

  def last_guessed_number
    guess = find_latest_guess
    guess.first_color << guess.second_color << guess.third_color << guess.fourth_color if guess
  end

  def guesses_left
    number_of_guesess - guesses.count
  end

  def lost?
    number_of_guesess == guesses.count
  end

  def won?
    target_guess_number == last_guessed_number
  end
end