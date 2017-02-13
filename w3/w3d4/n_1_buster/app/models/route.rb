# == Schema Information
#
# Table name: routes
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Route < ActiveRecord::Base
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  has_many :drivers,
    through: :buses,
    source: :drivers

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # TODO: your code here
    bd = Hash.new { |h, k| h[k] = [] }
    
    self.drivers.each { |d| bd[d.bus_id] << d.name }

    bd
  end
end
