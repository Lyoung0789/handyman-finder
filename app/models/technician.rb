class Technician < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments, dependent: :destroy
    validates :name, presence: true
    validates :category, presence: true 
    validates :email, presence: true

    scope :filter_by_category, -> (params){where("Category = ?", "#{params}")}
    scope :search_by_name, -> (params){where("LOWER(name) LIKE ?", "%#{params}%")}



end
