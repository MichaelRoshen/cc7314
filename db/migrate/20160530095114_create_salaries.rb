class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :user_id
      t.float :price
      t.float :bonus
      t.date :grant_date

      t.timestamps null: false
    end
  end
end
