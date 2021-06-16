class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def mypage
  end

  def mypost
    @user = current_user.name
    # @posts = Post.where("user_id = #{current_user.id}" ).page(params[:page]).per(10)
    @posts = current_user.posts.page(params[:page]).per(10)
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