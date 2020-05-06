class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :technician
  validates :date, presence: true 
  validates :date, uniqueness: true 
  validates :issue, presence: true 
end
