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
    @icon = ["混雑1.jpg", "混雑2.jpg", "混雑3.jpg", "混雑4.jpg", "混雑5.jpg"]
  end

  def delete
    @post = Post.find(params[:id])
    if @post.delete
      flash[:notice] = "投稿を削除しました"
    else
      flash[:alert] = "削除できません"
    end
    redirect_back fallback_location: mypost_user_path(current_user.id)
  end
end
