class AppointmentsController < ApplicationController
    def new 
        
        if params[:technician_id] && @tech = Technician.find_by(id: params[:technician_id])
            # byebug
            @appointment = @tech.appointments.build
        else 
            @appointment = Appointment.new
        end 
    end 

    def create 
        
        @tech = Technician.find_by(id: params[:appointment][:technician_id])
        
        new_date = DateTime.parse(params[:appointment][:date])
        check_date = @tech.appointments.find{|a| a.date == new_date}
        @appointment = current_user.appointments.build(appointment_params)

        if !check_date

            if @appointment.save
                redirect_to user_path(current_user)
            else 
                flash[:error] = "Must have a valid date and an Issue."
                redirect_to new_technician_appointment_path(params[:appointment][:technician_id])
                
            end 
        else 
            #check this. Render vs Redirect
            flash[:error] = "Must have a valid date and an Issue."
            render :new
        end 

    end 

    def show 
        # binding.pry
        find_appointment
        if current_user.id != @appointment.user_id
            flash[:error] = "You do not have access to that page."
            redirect_to user_path(current_user)
        end 
    end 

    def index
        @tech = Technician.find_by(id: params[:technician_id])
        # byebug 
    end 

    def update 
        binding.pry
    end 


    def edit 
        # binding.pry
        find_appointment
        if current_user.id != @appointment.user_id
            flash[:error] = "You do not have access to that page."
            redirect_to user_path(current_user)
        end 
        
    end 

    def update 
        # binding.pry
        find_appointment
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)

    end 


    def destroy 
        # binding.pry
        find_appointment
        @appointment.destroy
        redirect_to user_path(current_user)
    end 
    private 

    def appointment_params
        params.require(:appointment).permit(:date, :issue, :technician_id)
    end 

    def find_appointment
        @appointment = Appointment.find_by(id: params[:id])
    end 
end
