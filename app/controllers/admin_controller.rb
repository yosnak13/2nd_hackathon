class AdminController < ApplicationController

  before_action :except_non_administrator

  def users_index
    @users = User.all
  end

  def posts_index
    
  end

  def show_user
    @user = User.find_by(id: params[:id])
  end

  private
    def except_non_administrator
      if current_user.admin != 1
        redirect_to root_path
      end
    end

end
