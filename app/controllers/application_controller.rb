class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
  	begin
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	    @current_user ||= NilUser.new
  	rescue Exception => e
  		@current_user ||= NilUser.new
  	end
  end
  helper_method :current_user
end
