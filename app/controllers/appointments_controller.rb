class AppointmentsController < ApplicationController
    
    def new 
        # binding.pry
        if current_user.management == true 
            flash[:error] = "You do not have permission to do that."
            redirect_to user_path(current_user)
        end 
        if params[:technician_id] && @tech = Technician.find_by(id: params[:technician_id])
            @appointment = @tech.appointments.build
        else 
            @appointment = Appointment.new
        end 
    end 

    def create 
        # binding.pry
        @tech = Technician.find_by(id: params[:appointment][:technician_id])
        if params[:appointment][:date].empty?
            flash[:error] = "Date cannot be empty."
            redirect_to new_technician_appointment_path(@tech)
        else 
            new_date = DateTime.parse(params[:appointment][:date])
            check_date = @tech.appointments.find{|a| a.date == new_date}
            @appointment = current_user.appointments.build(appointment_params)
            if !check_date
                if @appointment.save
                    redirect_to user_path(current_user)
                else 
                    #when render:new it does not follow nested route. 
                    flash[:error] = "Must have a valid date and an Issue."
                    redirect_to new_technician_appointment_path(params[:appointment][:technician_id])
                    
                    
                end 
            else 
                flash[:error] = "There is an appointment already booked for this time."
                redirect_to new_technician_appointment_path(params[:appointment][:technician_id])
            end 
        end 

    end 

    def show 
        
        find_appointment
        if current_user.id != @appointment.user_id
            no_access
        end 
    end 

    def index
        @tech = Technician.find_by(id: params[:technician_id])
       
    end 

    def edit 
        find_appointment
        if current_user.id != @appointment.user_id
            no_access
        end 
        
    end 

    def update 
        find_appointment
       if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
       else 
        render :edit
       end 
    end 


    def destroy 
        find_appointment
        if @appointment.nil? || current_user.id != @appointment.user_id
            flash[:error] = "You do not have permission to do that."
            redirect_to user_path(current_user)
        else 
            @appointment.destroy
            redirect_to user_path(current_user)
        end 
    end 
    

    
    private 

    def appointment_params
        params.require(:appointment).permit(:date, :issue, :technician_id)
    end 

    def find_appointment
        @appointment = Appointment.find_by(id: params[:id])
    end 
end
