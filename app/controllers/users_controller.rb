class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def mypage
  end

  def mypost
    @user = current_user.name
    @posts = Post.where("user_id = #{current_user.id}").includes(:station).order(date: 'DESC', time: 'DESC').page(params[:page]).per(100)
  end

end