class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new 
        @user = User.new
        # binding.pry
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end 
    
    def show 
        
        if correct_user? 
            find_user
        else 
            no_access
        end 
    end 

    def edit       
        if correct_user?
            find_user
        else 
            no_access
        end   
    end 

    def update    
        find_user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit
        end 
        
    end 


    private 
    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :username, :password, :management)
    end 

    def find_user
        @user = User.find_by(id: params[:id])
    end 


end
