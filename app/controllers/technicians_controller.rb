class TechniciansController < ApplicationController

    def index 
        @technicians = Technician.all 
        
        if params[:q]
            @technicians = @technicians.search_by_name(params[:q].downcase)
        end  
        
        @technicians = @technicians.filter_by_category(params[:technician][:category]) if params[:technician] && !params[:technician][:category].empty?

       
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
