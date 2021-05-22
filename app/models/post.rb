class Post < ApplicationRecord
  belongs_to :users
  belongs_to :stations
end
