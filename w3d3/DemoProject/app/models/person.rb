class Person < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :houses,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
end
