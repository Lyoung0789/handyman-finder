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
        # byebug
        @appointment = current_user.appointments.build(appointment_params)

        if @appointment.save
            redirect_to user_path(current_user)
        else 
            render :new 
        end 

    end 

    def show 
        
    end 

    private 

    def appointment_params
        params.require(:appointment).permit(:date, :issue, :technician_id)
    end 
end
