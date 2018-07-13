class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:password], params[:user][:email])
    if @user
      log_in_user!(@user)
      redirect_to bands_url
    else
      redirect_to new_session_url
    end
  end
  
  def destroy
    logout!
  end
end
