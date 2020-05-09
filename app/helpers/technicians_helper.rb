module TechniciansHelper

    def technician_details(tech)
        link_to "More Details", technician_path(tech)
    end

end
