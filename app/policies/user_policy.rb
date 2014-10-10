class UserPolicy < ApplicationPolicy
  def index?
    user.therapist?
  end

  def destroy?
    user.therapist?
  end
end
