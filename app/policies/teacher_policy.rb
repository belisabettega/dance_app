class TeacherPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    !user&.is_a_teacher?
  end

  def create?
    !user&.is_a_teacher?
  end
end
