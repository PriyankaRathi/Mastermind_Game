class AddColumnAllowDuplicatesToGame < ActiveRecord::Migration
  def change
    add_column :games, :allow_duplicates , :boolean , :default => true
  end
end
