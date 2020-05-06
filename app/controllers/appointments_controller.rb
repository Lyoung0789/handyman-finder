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
        @tech = Technician.find_by(id: params[:appointment][:technician_id])
        # binding.pry
        new_date = DateTime.parse(params[:appointment][:date])
        something = @tech.appointments.find{|a| a.date == new_date}
        @appointment = current_user.appointments.build(appointment_params)

        if !something

            if @appointment.save
                redirect_to user_path(current_user)
            else 
                flash[:error] = "Must have a valid date and an Issue."
                redirect_to new_technician_appointment_path(params[:appointment][:technician_id])
                
            end 
        else 
            flash[:error] = "Must have a valid date and an Issue."
            render :new
        end 

    end 

    def show 
        @appointment = Appointment.find_by(id: params[:id])
    end 

    def index
        @tech = Technician.find_by(id: params[:technician_id])
        # byebug
        
    end 
    private 

    def appointment_params
        params.require(:appointment).permit(:date, :issue, :technician_id)
    end 
end
