class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  

  def index
    @teachers = policy_scope(Teacher)

    @markers = @teachers.geocoded.map do |teacher|
      {
        lat: teacher.latitude,
        lng: teacher.longitude,
        info_window: render_to_string(partial: "info_window", locals: { teacher: teacher })
      }
    end
  end
end
