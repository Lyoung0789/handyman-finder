class Technician < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments, dependent: :destroy
    validates :name, presence: true
    validates :category, presence: true 
    validates :email, presence: true

    scope :filter_by_category, -> (params){where("Category = ?", "#{params}")}

    def self.search_by_name(params)
        # byebug
        where("LOWER(name) LIKE ?", "%#{params}%")
    end 

 

end
