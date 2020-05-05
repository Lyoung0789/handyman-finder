class TechniciansController < ApplicationController

    def index 
        @technicians = Technician.all 
        #the index is where im going to have to do nested routing with appointments    
    end 

    def show
        @technician = Technician.find_by(id: params[:id])
    end 


end
