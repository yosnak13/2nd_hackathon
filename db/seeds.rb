# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# station一覧作成
# require "csv"
# CSV.foreach('db/station_shinjukuline.csv', headers: true) do |row|
#   Station.create(
#     station_name: row[0],
#     station_number: row[1],
#     line: row[2],
#   )
# end

# サンプルuser作成
5.times do
  User.create!(
    name: Faker::Games::StreetFighter.character,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
  )
end

# サンプルpost作成
50.times do
  date = Faker::Date.between(from: '2021-05-19', to: '2021-05-27')
  train_type = ["快速急行/Fライナー", "通勤急行", "急行", "準急", "各駅停車"]
  day = ["日", "月", "火", "水", "木", "金", "土"]
  post = Post.create!(
    user_id: Faker::Number.within(range: 1..5),
    station_id: Faker::Number.within(range: 1..36),
    congestion_level: Faker::Number.within(range: 1..5),
    date: date,
    day_of_week: day[Faker::Number.within(range: 0..6)],
    time: Faker::Number.within(range: 0..23),
    direction: Faker::Number.within(range: 0..1),
    train_type: train_type[Faker::Number.within(range: 0..4)],
    comment: Faker::Games::StreetFighter.quote,
  )
end