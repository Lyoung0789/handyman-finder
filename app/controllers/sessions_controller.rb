class SessionsController < ApplicationController


    def new 
        @user = User.new
    end 

    def create 
        # byebug
        if @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            # byebug
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