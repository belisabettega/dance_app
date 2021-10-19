class BookingsController < ApplicationController
  def create
    @slot = Slot.find(params[:slot_id])
    authorize @slot
    @booking = Booking.new(slot_id: @slot.id, user_id: current_user.id)
    if @booking.save 
      redirect_to root_path
    else
      render 'teachers/index'
    end
  end
end
