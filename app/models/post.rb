class Post < ApplicationRecord
  belongs_to :user
  belongs_to :station

  validates :direction, presence: true
  validates :train_type, presence: true
  validates :station_id, presence: true
  validates :date, timeliness: { on_or_before: :now, format: '%Y-%m-%d'}, allow_blank: false
  validates :day_of_week, presence: true
  validates :time, presence: true
  validates :congestion_level, presence: true
  validates :comment, length: { maximum:140 }

  enum direction: { "西武新宿方面" => 0,  "本川越方面" => 1 }
  enum congestion_level: { "着席できる" => 1, "座れないが立って乗れる" => 2, "座席の前で立てる" => 3, "立っているのがやっと" => 4, "乗り切れないほど混雑している" => 5 }
  enum train_type: { "快速急行/Fライナー" => "快速急行/Fライナー", "通勤急行" => "通勤急行", "急行" => "急行", "準急" => "準急", "各駅停車" => "各駅停車" }
end
