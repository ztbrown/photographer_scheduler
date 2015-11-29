class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :rate
      t.date :wedding_date
      t.integer :photographer_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
