class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :content
      t.string :state
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
