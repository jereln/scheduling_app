class AppointmentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.class == Therapist
        scope.all
      else
        scope.where(reserved: true)
      end
    end
  end

  def create?
    current_therapist
  end
end
