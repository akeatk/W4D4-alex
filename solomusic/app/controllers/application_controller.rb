class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user
  
  def current_user
    @current_user
  end
  
  def log_in_user!(user)
    flash[:errors] = ['not a user'] if !user
    session[:session_token] = user.reset_session_token
    @current_user = user
  end
  
  def logged_in?
    @current_user = User.find_by(session_token: session[:session_token])
    !!@current_user
  end
  
  def logout!
    current_user.reset_session_token if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
