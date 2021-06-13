class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_q, only: [:index, :search]
  before_action :set_scraping, only: [:index, :search]
  before_action :set_posts, only: [:index, :search]


  def index    
    @graph = Post.group(:time).order(time: 'ASC').average(:congestion_level)
  end

  def about
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def search
    @results = @q.result
    @search = Post.where(direction:params[:q][:direction]).where(station_id:params[:q][:station_id]).where(day_of_week:params[:q][:day_of_week])
    @graph = @search.group(:time).order(time: 'ASC').average(:congestion_level)
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  private
    def post_params
      params.require(:post).permit(:comment, :congestion_level, :date, :day_of_week, :time, :direction, :train_type, :station_id)
    end

    def set_scraping
      require 'nokogiri'
      require 'open-uri'
      url = 'https://transit.yahoo.co.jp/traininfo/detail/86/0/'
      doc = Nokogiri::HTML(open(url),nil,"utf-8")
      nodes = doc.xpath('//*[@id="mdServiceStatus"]/dl/dt/text()')
      @traffic = nodes.each { |node| pp node }
    end

    def set_posts
    @posts = Post.all.includes(:user, :station).order(date: 'DESC', time: 'DESC').limit(30)
    @icon = ["混雑1.jpg", "混雑2.jpg", "混雑3.jpg", "混雑4.jpg", "混雑5.jpg"]
    end
end
