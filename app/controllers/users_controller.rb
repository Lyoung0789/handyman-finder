class UsersController < ApplicationController

    def new 
        # binding.pry
        @user = User.new
    end 

    def create
        byebug
    end 
    
    private 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :username, :password)
    end 
end
