# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
House.create(nickname: 'CohortX', address: 'Folsom and 15th')
House.create(nickname: 'The Estate', address: 'Hollywood Blvd, 90210')
Person.create(name: 'Leo', house_id: '1')
Person.create(name: 'Chase', house_id: '2')
