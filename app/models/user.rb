class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def already_favorited?(station, direction)
    self.favorites.exists?(station_id: station.id, direction: direction)
  end
end
