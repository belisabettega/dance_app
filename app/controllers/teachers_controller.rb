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

  def new
    @teacher = Teacher.new
    authorize @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)
    authorize @teacher
    if @teacher.save
      redirect_to teachers_path
    else
      render 'new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:description, :photo, :price, :address)
  end
end
