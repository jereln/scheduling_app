class Appointment < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
  belongs_to :therapist, class_name: 'User'

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :reservation_valid, on: :update
  validate :valid_block

  def reservation_valid
    if reservation_time < start_time || reservation_time > end_time
      errors.add(:reservation_time, 'must be within the available block')
    end
  end

  def valid_block
    if start_time > end_time
      errors.add(:start_time, 'must be before the start time')
    end

    if date < Time.now
      errors.add(:date, 'must be in the future')
    end
  end
end
