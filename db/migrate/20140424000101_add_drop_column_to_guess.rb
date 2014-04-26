class AddDropColumnToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :game_id, :integer , :null => false
    add_index :guesses, :game_id
    remove_column :guesses, :mastermind_game_id
  end
end
