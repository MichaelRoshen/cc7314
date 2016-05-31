class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :phone
      t.string :address
      t.date :send_date
      t.date :repair_date
      t.string :repairman
      t.text :summary
      t.text :note

      t.timestamps null: false
    end
  end
end
