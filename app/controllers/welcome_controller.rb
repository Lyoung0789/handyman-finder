class WelcomeController < ApplicationController
    skip_before_action :verified_user, only: [:hello]
    def hello
        # byebug
        if current_user 
            redirect_to user_path(current_user)
        end 
    end 
end
