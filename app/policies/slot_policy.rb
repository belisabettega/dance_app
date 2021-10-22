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
    record.user == user
  end
end
