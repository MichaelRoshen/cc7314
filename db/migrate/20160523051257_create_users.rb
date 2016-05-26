class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :id_card
      t.integer :age
      t.string :phone
      t.string :role
      t.string :email
      t.integer :cell_gate
      t.integer :floor
      t.integer :house_num
      t.date :room_in_date
      t.integer :room_type_id
      t.integer :building_id
      t.float :area
      t.timestamps null: false
    end
  end
end


