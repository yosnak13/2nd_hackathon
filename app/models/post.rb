class Post < ApplicationRecord
  belongs_to :user
  belongs_to :station

  validates :direction, presence: true
  validates :train_type, presence: true
  validates :date, timeliness: { on_or_before: :now, format: '%Y-%m-%d'}, allow_blank: false
  validates :day_of_week, presence: true
  validates :time, presence: true
  validates :congestion_level, presence: true
  validates :comment, length: { maximum:140 }

  enum direction: { "西武新宿方面" => 0,  "本川越方面" => 1 }
  enum congestion_level: { "着席できる" => 1, "座れないが立って乗れる" => 2, "座席の前で立てる" => 3, "立っているのがやっと" => 4, "乗り切れないほど混雑している" => 5 }
  enum train_type: { "快速急行/Fライナー" => "快速急行/Fライナー", "通勤急行" => "通勤急行", "急行" => "急行", "準急" => "準急", "各駅停車" => "各駅停車" }

  # 検索の際の期間絞り込み
  scope :s_duration, ->(start_date) { where("date >= ?", start_date) if start_date.present? }
  scope :e_duration, ->(end_date) { where("date <= ?", end_date) if end_date.present? }
  
  # 検索の際の時間絞り込み
  scope :s_time, ->(start_time) { where("time >= ?", start_time) if start_time.present? }
  scope :e_time, ->(end_time) { where("time >= ?", end_time) if end_time.present? }

  # 検索の際の方面と駅の絞り込み
  scope :direction, ->(direction) { where("direction = ?", direction) if direction.present? }
  scope :station, ->(station) { where("station_id = ?", station) if station.present? }

end