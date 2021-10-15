class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  

  def index
    @teachers = policy_scope(Teacher)
  end
end
