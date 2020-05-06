class TechniciansController < ApplicationController

    def index 
        @technicians = Technician.all 
        
        if params[:q]
            @technicians = @technicians.search_by_name(params[:q].downcase)
        end  
        
        @technicians = @technicians.filter_by_category(params[:technician][:category]) if params[:technician] && !params[:technician][:category].empty?

       
    end 

    def new
        # binding.pry
        if current_user.technician == false
            redirect_to "/"
        else 
            
             @tech = Technician.new
             
        end 
    end 

    def create
        # binding.pry
        @tech = Technician.new(tech_params)
        if @tech.save
            redirect_to technician_path(@tech)
        else
            render :new
        end 

    end 

    def show
        @technician = Technician.find_by(id: params[:id])
    end 

    def edit 
        # binding.pry
        @technician = Technician.find_by(id: params[:id])

    end 

    def update
        # binding.pry
        @technician = Technician.find_by(id: params[:id])
        if @technician.update(tech_params)
            redirect_to technician_path(@technician)
        else 
            render :edit
        end 
    end 


    private 
    def tech_params
        params.require(:technician).permit(:name, :phone_number, :email, :category)
    end 
end
