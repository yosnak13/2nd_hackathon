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
    @user = current_user
    @favorites = @user.favorites
    if @favorites.present?
      true
    else
      redirect_to root_path
    end
  end

end