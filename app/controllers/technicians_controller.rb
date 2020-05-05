class TechniciansController < ApplicationController

    def index 
        @technicians = Technician.all 

        if !params[:q].empty? #search
            @technicians = @technicians.search(params[:q].downcase)
        end   
    end 

    def show
        @technician = Technician.find_by(id: params[:id])
    end 


end
