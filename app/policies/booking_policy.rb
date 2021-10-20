class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: user.id, status: true)
    end
  end

  def create?
    user.is_a_teacher? ? record.teacher != user.teacher : true
  end

  def cancel?
    record.user == user || record.slot.user == user
  end
end
