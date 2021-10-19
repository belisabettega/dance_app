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

  def reserve
    @slot = Slot.find(params[:slot_id])
    authorize @slot
    if @slot.update(provisional: false) && @slot.bookings.map(&:cancel_booking)
      redirect_to slots_path, notice: "The slot was reserve!"
    else
      redirect_to slots_path, notice: "Sorry, something went wrong"
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:start_time, :duration)
  end
end
