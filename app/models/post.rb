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

  # enum direction: { "西武新宿方面" => 1,  "本川越方面" => 2 }
  # enum congestion_levels: { "着席できる" => 10, "座れないが立って乗れる" => 20, "座席の前で立てる" => 30, "立っているのがやっと" => 40, "乗り切れないほど混雑している" => 50 }
  # enum train_type: { "快速急行/Fライナー" => 100, "通勤急行" => 200, "急行" => 300, "準急" => 400, "各駅停車" => 500 }
  # enum day_of_week: { "日曜日" => 0000, "月曜日" => 1000, "火曜日" => 2000, "水曜日" => 3000, "木曜日" => 4000, "金曜日" => 5000, "土曜日" => 6000}
end
