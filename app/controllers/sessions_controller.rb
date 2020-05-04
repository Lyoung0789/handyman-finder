class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new 
        @user = User.new
    end 

    def create 
        
        if @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            
            redirect_to user_path(@user)
          else
            redirect_to '/login'
            end
        end 
    end 

    def destroy 
        session.clear 
        redirect_to '/'
    end 
end 