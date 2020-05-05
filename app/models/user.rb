class User < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :technicians, through: :appointments
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true 
    validates :name, presence: true
end
