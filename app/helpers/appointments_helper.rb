module AppointmentsHelper
    def formatted_date(appointment)
        appointment.date.strftime("%A, %b %d at, %I:%M:%S %p") 
    end 
end
