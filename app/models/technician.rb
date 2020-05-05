class Technician < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

    def self.search(params)
        # byebug
        where("LOWER(category) LIKE ?", "%#{params}%")
    end 

end
