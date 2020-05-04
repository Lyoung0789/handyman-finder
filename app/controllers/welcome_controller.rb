class WelcomeController < ApplicationController
    skip_before_action :verified_user, only: [:hello]
    def hello
    end 
end
