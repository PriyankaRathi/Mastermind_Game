class Guess < ActiveRecord::Base
  belongs_to :game
  validates :game_id, :first_color, :second_color, :third_color, :fourth_color , :presence => true
  validates :first_color, :second_color, :third_color, :fourth_color , :format => {:with => /\A[1-5]\Z/}

  def find_guessed_number
    @guess_number = self.first_color << self.second_color << self.third_color << self.fourth_color
  end

  def find_correct_digits_index
    find_guessed_number
    @correct_positions = game.target_guess_number.length.times.find_all {|i| game.target_guess_number[i] == @guess_number[i]}
  end

  def find_correct_digits_count
    find_correct_digits_index
    @correct_positions.count
  end

  def find_correct_at_wrong_postion_digit_count
    @correct_positions.each{|i| @guess_number[i] = '*'}
    game.target_guess_number.length.times.select do |i|
      @guess_number[@guess_number.index(game.target_guess_number[i])] = '*' if @guess_number.include?(game.target_guess_number[i]) && !@correct_positions.include?(i)
    end.count
  end
end
