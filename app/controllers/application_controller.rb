class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user
    helper_method :logged_in?
    helper_method :correct_user?
    helper_method :no_access

    private 
    def verified_user
        redirect_to '/' unless logged_in?
      end
    
      # def user_is_authenticated
      #   !!current_user
      # end
    
      def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      end

      def logged_in?
        !!session[:user_id]
      end 

      def correct_user? 
        current_user.id == params[:id].to_i
      end 

      def no_access 
        flash[:error] = "You do not have access to that page."
        redirect_to user_path(current_user)
    end 

end
