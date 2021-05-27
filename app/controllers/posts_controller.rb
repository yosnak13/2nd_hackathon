class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_stations

  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    # 受け取った日付から曜日を選択
    day = Date.parse(params[:post][:date])
    case day.wday
    when 0 then
      @post.day_of_week = "日"
    when 1 then
      @post.day_of_week = "月"
    when 2 then
      @post.day_of_week = "火"
    when 3 then
      @post.day_of_week = "水"
    when 4 then
      @post.day_of_week = "木"
    when 5 then
      @post.day_of_week = "金"
    when 6 then
      @post.day_of_week = "土"
    end
      if @post.save
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
    params.require(:post).permit(:comment, :congestion_level, :date, :day_of_week, :time, :direction, :train_type, :station_id)
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
