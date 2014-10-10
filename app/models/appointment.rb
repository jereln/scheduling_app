class Appointment < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
  belongs_to :therapist, class_name: 'User'

  validates :date, presence: true
  validates :start_time, prsence: true
  validates :end_time, presence: true
end
