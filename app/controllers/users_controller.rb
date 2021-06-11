class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def mypage
  end

  def mypost
    @user = current_user.name
    @posts = Post.where("user_id = #{current_user.id}" )
    @favorite_tweets = @user.favorite_tweets
  end

  def favorite
    @user = User.find(params[:id])
    @station = @user.station
    @favorites = @user.favorite_stations
    if @favorites.present?
      true
    else
      redirect_to root_path, notice: '商品がありません'
    end
  end

end