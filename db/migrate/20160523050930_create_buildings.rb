class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.integer :num
      t.string :name
      t.string :face
      t.integer :floor_num
      t.integer :building_type_id
      t.integer :estate_id

      t.timestamps null: false
    end
  end
end
