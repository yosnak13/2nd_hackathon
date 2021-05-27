class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @graph = Post.group(:time).average(:congestion_level)
  end
end
