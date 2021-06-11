class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :station
  validates_uniqueness_of :station_id, scope: :user_id
end
