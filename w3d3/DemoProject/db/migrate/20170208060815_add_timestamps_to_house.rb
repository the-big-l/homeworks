class AddTimestampsToHouse < ActiveRecord::Migration
  def change
    add_column(:house, :created_at, :datetime)
    add_column(:house, :updated_at, :datetime)
  end
end
