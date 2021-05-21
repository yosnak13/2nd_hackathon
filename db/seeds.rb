# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/station_sinzyukuline.csv', headers: true) do |row|
  Newstation.create(
    station_name: row['station_name'],
    station_number:row['station_numbe'],
    line: row['line'],
  )
end
