class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_stations

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.present?
        @post.save
        flash[:notice] = "投稿しました！"
        redirect_to root_path
      else
        flash.now[:alert] = "空欄を埋めてください"
        render :index
      end
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to root_path
  end

  private
  def post_params
    params.permit(:user_id, :staition_id, :comment, :congestion_level, :date, :time, :direction)
  end

  def set_stations
    @stations = Station.all
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end
end
