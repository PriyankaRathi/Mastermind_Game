class Game < ActiveRecord::Base
  has_many :guesses

  NO_OF_COLORS_IN_GAME = 4
  LAST_COLOR_ID = ColorScheme.last.color_id

  before_validation :pick_target_guess_number
  validates :user, :number_of_guesess, :target_guess_number , :presence => true
  validates :target_guess_number, :format => {:with => /\A[1-LAST_COLOR_ID]{4}\Z/}
  #before_save :pick_non_duplicate_combination unless "#{"allow_duplicates"}"

  def pick_target_guess_number
    guess_num = ""
    
    if allow_duplicates
      NO_OF_COLORS_IN_GAME.times do 
        guess_num << rand(1..LAST_COLOR_ID).to_s
      end
    else
      guess_num = (1..LAST_COLOR_ID).to_a.sample(NO_OF_COLORS_IN_GAME).join
    end
    self.target_guess_number = guess_num if self.target_guess_number.blank?
  end

  #def pick_non_duplicate_combination
    #self.target_guess_number = (1..LAST_COLOR_ID).sort_by{rand}[1..NO_OF_COLORS_IN_GAME].join
    #self.target_guess_number = (1..LAST_COLOR_ID).to_a.sample(NO_OF_COLORS_IN_GAME).join
  #end

  def find_latest_guess
    guesses.order("created_at").last
  end

  def last_guessed_number
    guess = find_latest_guess
    guess.first_color << guess.second_color << guess.third_color << guess.fourth_color if guess
  end

  def guesses_left
    number_of_guesess - guesses.count
  end

  def lost?
    number_of_guesess == guesses.count && !won?
  end

  def won?
    target_guess_number == last_guessed_number
  end
end