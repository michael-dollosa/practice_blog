class ApplicationController < ActionController::Base
  helper_method :check_current_user, :is_logged_in?
  def check_current_user
    #if there is session, find user based on parameters via memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !!check_current_user
  end

  def require_login
    unless check_current_user
      redirect_to article_path
    end
  end
end
