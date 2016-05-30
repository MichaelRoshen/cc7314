class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :count
      t.float :price
      t.float :total_price
      t.date :date
      t.integer :product_type_id
      t.string :note

      t.timestamps null: false
    end
  end
end
