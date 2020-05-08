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
        if current_user.management == false
            redirect_to "/"
        else         
             @technician = Technician.new 
        end 
    end 

    def create
        # binding.pry
        @technician = Technician.new(tech_params)
        if @technician.save
            redirect_to technician_path(@technician)
        else
            render :new
        end 

    end 

    def show
       
        find_technician
       
    end 

    def edit 
        if current_user.management == true 
            find_technician
        else 
            no_access
        end 
    end 

    def update
        
        find_technician
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

    def find_technician
        @technician = Technician.find_by(id: params[:id])
    end 

end
