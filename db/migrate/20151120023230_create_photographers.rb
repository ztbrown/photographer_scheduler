class CreatePhotographers < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :rate

      t.timestamps null: false
    end
  end
end
