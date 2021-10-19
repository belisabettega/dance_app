class TeacherPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user&.is_a_teacher? ? scope.all.where.not(user_id: user.id) : scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end
end
