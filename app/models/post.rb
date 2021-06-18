class Post < ApplicationRecord
  belongs_to :user
  belongs_to :station

  validates :train_type, presence: true
  validate :date_after_future
  validates :day_of_week, presence: true
  validates :time, presence: true
  validates :congestion_level, presence: true
  validates :comment, length: { maximum:140 }

  enum direction: { "西武新宿方面" => 0,  "本川越方面" => 1 }
  enum train_type: { "快速急行/Fライナー" => "快速急行/Fライナー", "通勤急行" => "通勤急行", "急行" => "急行", "準急" => "準急", "各駅停車" => "各駅停車" }
  enum time: {"4時台" => 4, "5時台" => 5, "6時台" => 6, "7時台" => 7, "8時台" => 8,
              "9時台" => 9, "10時台" => 10, "11時台" => 11, "12時台" => 12, "13時台" => 13, "14時台" => 14, "15時台" => 15,
              "16時台" => 16, "17時台" => 17, "18時台" => 18, "19時台" => 19, "20時台" => 20, "21時台" => 21, "22時台" => 22,
              "23時台" => 23, "0時台" => 0,  "1時台" => 1 }

  # 検索の際の期間絞り込み
  scope :s_duration, ->(start_date) { where("date >= ?", start_date) if start_date.present? }
  scope :e_duration, ->(end_date) { where("date <= ?", end_date) if end_date.present? }

  # 検索の際の時間絞り込み
  scope :s_time, ->(start_time) { where("time >= ?", start_time) if start_time.present? }
  scope :e_time, ->(end_time) { where("time <= ?", end_time) if end_time.present? }

  # 検索の際の方面と駅の絞り込み
  scope :direction, ->(direction) { where("direction = ?", direction) if direction.present? }
  scope :station, ->(station) { where("station_id = ?", station) if station.present? }

  def date_after_future
    return if date.blank?
    errors.add(:date, "は今日以前のものを選択してください") if date > Date.today
  end

end
