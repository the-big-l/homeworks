class RenameHouseToHouses < ActiveRecord::Migration
  def change
    rename_table :house, :houses
  end
end
