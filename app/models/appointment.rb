class Appointment < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
  belongs_to :therapist, class_name: 'User'
end
