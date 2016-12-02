class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followers, :followings]
  before_action :check_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @projects = @user.projects.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Ikigomi.com!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followers
    @users = @user.follower_users
    @users_count = @user.follower_users
    @title = "Follower"
    render 'show_follow'
  end
  
  def followings
    @users = @user.following_users
    @users_count = @user.following_users
    @title = "Following"
    render 'show_follow'
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :area, :profile, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    redirect_to root_path if @user != current_user
  end
end
