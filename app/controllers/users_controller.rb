class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new 
        # binding.pry
        @user = User.new
    end 

    def create
        # binding.pry
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end 
    
    def show 
        if current_user.id != params[:id].to_i
            redirect_to user_path(current_user)
        end 
        @user = User.find_by(id: params[:id])
        # byebug
    end 

    def edit 
        # binding.pry
        if correct_user?
            @user = User.find_by(id: params[:id])
        else 
            flash[:error] = "You do not have access to that page"
            redirect_to user_path(current_user)
        end 

        
    end 

    def update 
        # binding.pry
        @user = User.find_by(id: params[:id])

        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit
        end 
        
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :username, :password, :technician)
    end 
end
