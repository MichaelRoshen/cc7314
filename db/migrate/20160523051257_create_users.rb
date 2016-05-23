class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :id_card
      t.integer :age
      t.string :phone
      t.string :email
      t.string :address
      t.integer :estate_id
      t.integer :building_id

      t.timestamps null: false
    end
  end
end
