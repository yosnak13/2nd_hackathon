class AdminController < ApplicationController

  before_action :except_non_administrator
  before_action :find_user, only: [:show_user, :delete_user]

  def users_index
    @users = User.all
  end

  def posts_index
    
  end

  def show_user
 
  end

  def delete_user
    if @user.destroy
      flash[:notice] = "ユーザーを削除しました"
    else
      flash[:alert] = "削除できません"
    end
    redirect_to users_index_path
  end

  private
    def except_non_administrator
      if current_user.admin != 1
        redirect_to root_path
      end
    end

    def find_user
      @user = User.find_by(id: params[:id])
    end
end
