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
    return true if record.reserved == false
    return true if user.therapist?
    false
  end
end
