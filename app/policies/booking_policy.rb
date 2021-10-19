class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: user.id, status: true)
    end
  end

  def create?
    return true
  end

  def cancel?
    record.user == user
  end
end
