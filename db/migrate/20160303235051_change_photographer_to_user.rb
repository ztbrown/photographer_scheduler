class ChangePhotographerToUser < ActiveRecord::Migration
  def up
    rename_table :photographers, :users
  end
  def down
    rename_table :users, :photographers
  end
end
