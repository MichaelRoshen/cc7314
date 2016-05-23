class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :name
      t.float :area
      t.string :position
      t.integer :price

      t.timestamps null: false
    end
  end
end
