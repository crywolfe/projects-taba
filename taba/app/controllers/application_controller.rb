class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#define current_user in ApplicationController so I can access current_user in every controller which inherits from ApplicationController
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

#define a method to determine if current_user is in session and logged in.
  def logged_in?
    current_user.present?
  end

#need a helper method to be able to access the methods in other controllers.
  helper_method(:current_user, :logged_in?)

end
