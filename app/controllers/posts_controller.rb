class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all
    @stations = Station.all
  end

  def create
    @post = Post.new(params[:id])
    logger.debug("post = #{@post}")
      if @post.save
        redirect_to home_index_path
      end
  end

  def destroy
    @post.destroy
    redirect_to home_index_path
  end

  private
  def post_params
    params.require(:post).permit(:comment, :congestion_level, :date, :day_of_week, :time, :direction)
  end
end
