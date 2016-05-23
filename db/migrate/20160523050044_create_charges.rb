class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :name
      t.integer :charge_type_id
      t.float :price
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
