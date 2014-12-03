class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	render :index
 	end

  def login(user)
  	session[:token] = user.reset_session_token
  end

  def current_user
  	@u ||= User.find_by(session_token: session[:token])
  end
end
