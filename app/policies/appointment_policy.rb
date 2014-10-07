class AppointmentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.class == Therapist
        scope.all
      else
        scope.where(reserved: false)
      end
    end
  end

  def show?
    return true if record.reserved == false
    return true if user.class == Therapist
    return true if record.client_id == user.id
    false
  end
end
