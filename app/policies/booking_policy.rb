class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: user.id)
    end
  end

  def create?
    return true
  end
end
