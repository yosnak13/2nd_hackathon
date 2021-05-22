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

end
