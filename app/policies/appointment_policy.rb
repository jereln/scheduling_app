class AppointmentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user && user.therapist?
        scope.all
      else
        scope.where(reserved: false)
      end
    end
  end

  def show?
    user.therapist? || record.reserved == false || user.id == record.client_id
  end

  def create?
    user.therapist?
  end

  def destroy?
    user.therapist? && record.reserved == false
  end

  def update?
    user.therapist?
  end

  def cancel?
    user.therapist? || user.id == record.client_id
  end
end
