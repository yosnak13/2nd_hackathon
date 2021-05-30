class Station < ApplicationRecord
  
  has_many :posts, through: :posts, dependent: :destroy
end
