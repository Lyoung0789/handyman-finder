class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user
    helper_method :logged_in?

    private 
    def verified_user
        redirect_to '/' unless user_is_authenticated
      end
    
      def user_is_authenticated
        !!current_user
      end
    
      def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      end

      def logged_in?
        !!session[:user_id]
      end 

end
