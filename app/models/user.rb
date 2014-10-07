class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :client_appts, class_name: 'Appointment', foreign_key: 'client_id'
  has_many :therapists, through: :client_appts
  has_many :therapist_appts, class_name: 'Appointment', foreign_key: 'therapist_id'
  has_many :clients, through: :therapist_appts
end
