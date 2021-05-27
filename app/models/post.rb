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

  enum direction: { "西武新宿方面" => 0,  "本川越方面" => 1 }
  enum congestion_level: { "着席できる" => 1, "座れないが立って乗れる" => 2, "座席の前で立てる" => 3, "立っているのがやっと" => 4, "乗り切れないほど混雑している" => 5 }
  enum train_type: { "快速急行/Fライナー" => 0, "通勤急行" => 1, "急行" => 2, "準急" => 3, "各駅停車" => 4 }
end
