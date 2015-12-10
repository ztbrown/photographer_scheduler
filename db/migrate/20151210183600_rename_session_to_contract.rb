class RenameSessionToContract < ActiveRecord::Migration
  def change
    rename_table :sessions, :contracts
  end
end
