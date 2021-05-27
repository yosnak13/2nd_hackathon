# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"


CSV.foreach('db/shinjuku_post_dummy.csv', headers: true) do |row|
  Post.create(
    user_id: row[0],
    station_id: row[1],
    comment: row['2'],
    congestion_level: row[3],
    date: row['4'],
    day_of_week: row['5'],
    time: row[6],
    direction: row[7],
    train_type: row[8],
  )
end

