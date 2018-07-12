class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:password], params[:user][email])
    if @user
      render :users_url
    else
      redirect_to :new_session_url
    end
  end
  
  def destroy
    return if current_user.nil?
    logout!
    redirect_to :new_session_url
  end
end
