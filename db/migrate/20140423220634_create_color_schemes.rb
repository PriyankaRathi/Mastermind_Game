class CreateColorSchemes < ActiveRecord::Migration
  def change
    create_table :color_schemes do |t|
      t.integer :color_id , :null => false
      t.string  :color_name , :null => false
      t.timestamps
    end
  end
end
