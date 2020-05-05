class TechniciansController < ApplicationController

    def index 
        @technicians = Technician.all 
        # byebug
        if params[:q]
            @technicians = @technicians.search(params[:q].downcase)
        end   
    end 

    def new
        byebug
        if current_user.technician == false
            redirect_to "/"
        else 
             @tech = Technician.new
        end 
    end 


    def show
        @technician = Technician.find_by(id: params[:id])
    end 


end
