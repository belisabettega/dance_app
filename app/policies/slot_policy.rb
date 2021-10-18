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
end
