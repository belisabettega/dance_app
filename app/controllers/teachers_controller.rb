class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  

  def index
    @teachers = policy_scope(Teacher)

    @markers = @teachers.geocoded.map do |teacher|
      {
        lat: teacher.latitude,
        lng: teacher.longitude
      }
    end
  end
end
