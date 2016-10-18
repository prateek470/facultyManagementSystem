class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  unless Rails.env.production?
    rescue_from ActionController::InvalidCrossOriginRequest do
      unless Rails.application.config.consider_all_requests_local
        render_404
      end
    end
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
    

  end
  def check_permission
    if session[:permission] =='User'
      redirect_to professorhome_path
    end
  end
  def require_user

      redirect_to '/login' unless current_user
  end

end
