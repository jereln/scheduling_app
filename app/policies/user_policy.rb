class UserPolicy < ApplicationPolicy
  def index?
    user.therapist?
  end

  def destroy?
    user.therapist? || user.id == user.id
  end
end
