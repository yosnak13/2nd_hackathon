class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.all
    @graph = Post.group(:time).average(:congestion_level)
  end

  def about
  end

  
end
