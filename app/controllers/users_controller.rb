class UsersController < ApplicationController
  before_action :authenticate_user!, except:

  def index
    @posts = Post.all
  end

  def mypage
  end

  def mypost
    @user = current_user.name
    @posts = Post.where("user_id = #{current_user.id}" )
  end

end