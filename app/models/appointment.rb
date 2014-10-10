class Appointment < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
  belongs_to :therapist, class_name: 'User'

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :reservation_time, presence: true, on: :update, if: :user_client?

  def user_client?
    client_id
  end
end
