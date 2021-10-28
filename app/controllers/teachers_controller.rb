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

  def show
    @teacher = Teacher.find(params[:id])
    authorize @teacher
    @slots = @teacher.slots.where(provisional: true)
  end

  def new
    @teacher = Teacher.new
    authorize @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)
    authorize @teacher
    @teacher.user_id = current_user.id
    if @teacher.save
      redirect_to teachers_path, notice: "You're a teacher now!"
    else
      render 'new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
    authorize @teacher
  end

  def update
    @teacher = Teacher.find(params[:id])
    authorize @teacher
    if @teacher.update(teacher_params) && @teacher.user.update(full_name: params[:teacher][:user][:full_name])
      redirect_to teacher_path(@teacher), notice: "Your profile was updated!"
    else
      redirect_to teacher_path(@teacher), notice: "Something went wrong!"
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:description, :photo, :price, :address)
  end
end
