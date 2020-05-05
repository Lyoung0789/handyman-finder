class AppointmentsController < ApplicationController
    def new 
        # byebug
        if params[:technician_id] && tech = Technician.find_by(id: params[:technician_id])
            @appointment = tech.appointments.build
        else 
            @appointment = Appointment.new
        end 
    end 

    def create 

    end 


end
