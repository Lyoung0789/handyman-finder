class UsersController < ApplicationController

    def new 
        # binding.pry
        @user = User.new
    end 

    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end 
    
    def show 
        
        @user = User.find_by(id: params[:id])

    end 

    private 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :username, :password)
    end 
end
