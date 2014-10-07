class AppointmentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.therapist?
        scope.all
      else
        scope.where(reserved: false)
      end
    end
  end

  def show?
    user.therapist? || record.reserved == false
  end

  def create?
    user.therapist?
  end
end
