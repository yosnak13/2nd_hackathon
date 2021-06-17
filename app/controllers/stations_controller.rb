class StationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_q, only: [:index, :search]


  def index
    @posts = Post.all.includes(:user, :station).order(date: 'DESC', time: 'DESC').limit(30)
    @graph = Post.group(:time).average(:congestion_level)
  end

  def about
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def search
    @station = Station.find_by(id: params[:q][:station_id])
    
    require 'nokogiri'
    require 'open-uri'
    url = 'https://transit.yahoo.co.jp/traininfo/detail/86/0/'
    doc = Nokogiri::HTML(open(url),nil,"utf-8")
    nodes = doc.xpath('//*[@id="mdServiceStatus"]/dl/dt/text()')
    @traffic = nodes.each { |node| pp node }
    @results = @q.result
    @search = Post.where(direction:params[:q][:direction]).where(station_id:params[:q][:station_id]).where(day_of_week:params[:q][:day_of_week])
    @posts = Post.all.includes(:user, :station).order(date: 'DESC', time: 'DESC').limit(30)
    @graph = @search.group(:time).average(:congestion_level)
  end


  def post_params
    params.require(:station).permit(:station_name, :station_number, :line, :user_id)
  end
end