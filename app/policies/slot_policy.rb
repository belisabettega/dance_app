class SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(teacher_id: user.teacher.id)
    end
  end

  def new?
    user.is_a_teacher?
  end

  def create?
    user.is_a_teacher?
  end

  def reserve?
    record.user == user
  end

  def change?
    record.user == user || record.booking_active.user == user
  end

  def bookable?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end
end
