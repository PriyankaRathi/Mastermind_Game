class AddColumnToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :correct_digit , :integer , :default => 0
    add_column :guesses, :correct_digit_at_wrong_position , :integer, :default => 0
  end
end
