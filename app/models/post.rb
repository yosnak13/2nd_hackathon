class Post < ApplicationRecord
  belongs_to :user
  belongs_to :station
  validates :user_id, presence: true
  validates :station_id, presence: true
  validates :comment, length: { maximum:140 }
  validates :congestion_level, presence: true
  validates :date, presence: true
  validates :day_of_week, presence: true
  validates :time, presence: true
  validates :direction, presence: true

  enum direction: { 0 => "西武新宿方面",  1 => "本川越方面" }
  enum congestion_level: { 1 => "着席できる", 2 => "座れないが立って乗れる", 3 => "座席の前で立てる", 4 => "立っているのがやっと", 5 => "乗り切れないほど混雑している" }
end
