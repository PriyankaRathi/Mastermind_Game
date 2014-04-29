class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :mastermind_game_id , :null => false
      t.string :first_color , :null => false
      t.string :second_color , :null => false
      t.string :third_color , :null => false
      t.string :fourth_color , :null => false
      t.timestamps
      t.index :mastermind_game_id
    end
  end
end
