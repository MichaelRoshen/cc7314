class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_num
      t.string :room_type_id
      t.integer :building_id
      t.integer :user_id
      t.date :room_in_date
      t.integer :area

      t.timestamps null: false
    end
  end
end
