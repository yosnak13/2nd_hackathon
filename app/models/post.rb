class Post < ApplicationRecord
  belongs_to :users
  belongs_to :stations
  validates :user_id, presense: true
  validates :station_id, presense: true
  validates :comment, length: { maximum:140 }
  validates :congestion_level, presense: true
  validates :date, presense: true
  validates :day_of_week, presense: true
  validates :time, presense: true
  validates :direction, presense: true

  enum direction: { "西武新宿方面" => 0, "本川越方面" => 1 }
  enum congestion_level: { "着席できる" => 1, "座れないが立って乗れる" => 3, "座席の前で立てる" => 3, "立っているのがやっと" => 4, "乗り切れないほど混雑している" => 5}
end
