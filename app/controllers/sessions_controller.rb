class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :fbcreate, :githubcreate]

    def new 
        @user = User.new
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Username or Password is incorrect"
            redirect_to '/login'
        end  
    end 
    
    #omniauth
    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.username = auth['uid']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex 
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def githubcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['nickname']
            u.username = auth['uid']
            u.email = auth[:info][:nickname] + "@gmail.com"
            u.password = SecureRandom.hex 
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def destroy 
        session.clear 
        redirect_to '/'
    end 

    private 
    def auth
        request.env['omniauth.auth']
    end
end 