class CreateHouseTable < ActiveRecord::Migration
  def change
    create_table :house do |t|
      t.string :nickname
      t.string :address
    end
  end
end
