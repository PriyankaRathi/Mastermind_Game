class AlterColumnTargetGuessNumberOfGame < ActiveRecord::Migration
  def change
    change_column :games , :target_guess_number , :string
  end
end
