class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end
  
  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      render :index
    end
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to users_url
    else
      redirect_to new_user_url
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
