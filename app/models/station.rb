class Station < ApplicationRecord
  has_many :posts, through: :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
