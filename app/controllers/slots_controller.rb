class SlotsController < ApplicationController
  def index
    @slots = policy_scope(Slot)
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    authorize @slot
    @slot.teacher_id = current_user.teacher.id
    if @slot.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:start_time, :duration)
  end
end
