class Station < ApplicationRecord
    has_many :posts, through: :posts
end
