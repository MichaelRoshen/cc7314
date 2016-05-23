class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :name
      t.float :area
      t.string :postions
      t.integer :price

      t.timestamps null: false
    end
  end
end
