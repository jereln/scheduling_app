class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :uniqueness => { :case_sensitive => false}

  has_many :client_appts, class_name: 'Appointment', foreign_key: 'client_id'
  has_many :therapists, through: :client_appts
  has_many :therapist_appts, class_name: 'Appointment', foreign_key: 'therapist_id'
  has_many :clients, through: :therapist_appts

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end 
end
