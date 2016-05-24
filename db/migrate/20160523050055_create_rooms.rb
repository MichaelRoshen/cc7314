class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :house_num
      t.integer :cell_gate
      t.integer :floor
      t.integer :room_type_id
      t.integer :building_id
      t.integer :user_id
      t.date :room_in_date
      t.integer :area

      t.timestamps null: false
    end
  end
end

