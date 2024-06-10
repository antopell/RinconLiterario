class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
    end

    def logged_in?
        !!current_user
    end
    
    def require_user
        redirect_to logIn_path unless logged_in?
      end
    end