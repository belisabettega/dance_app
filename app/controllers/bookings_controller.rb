class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @slot = Slot.find(params[:slot_id])
    authorize @slot
    @booking = Booking.new(slot_id: @slot.id, user_id: current_user.id)
    if @booking.save
      @slot.update(provisional: false)
      redirect_to root_path
    else
      render 'teachers/index'
    end
  end
end
