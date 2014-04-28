class DeleteColumnFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :allow_duplicates
  end
end
