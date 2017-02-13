class AddNotNull < ActiveRecord::Migration
  def change
    change_column :people, :name, :string, null: false
    change_column :house, :address, :string, null: false
  end
end
