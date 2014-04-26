class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :user , :null => false
      t.integer :number_of_guesess , :null => false , :default => 6
      t.string :target_guess_number , :null => false
      t.timestamps
    end
  end
end
