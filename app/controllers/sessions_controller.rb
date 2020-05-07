class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :fbcreate]

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
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid'] #use a gem called secure random hex to produce a password
        end
        # binding.pry
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