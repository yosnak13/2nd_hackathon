class UsersController < ApplicationController
  before_action :authenticate_user!, except:

  def index
    @posts = Post.all
  end

  def mypage
  end

  def mypost
    @user = current_user.name
    @posts = current_user.posts.all
  end

end