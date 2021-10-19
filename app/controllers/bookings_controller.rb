class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @slot = Slot.find(params[:slot_id])
    @booking = Booking.new(slot_id: @slot.id, user_id: current_user.id)
    authorize @booking
    if @booking.save
      @slot.update(provisional: false)
      redirect_to bookings_path, notice: "Booking successfully created!"
    else
      redirect_to teachers_path, notice: "Something went wrong"
    end
  end

  def cancel
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    if @booking.cancel_booking && @booking.slot.update(provisional: true)
      redirect_to bookings_path, notice: "The booking was cancelled!"
    else
      redirect_to bookings_path, notice: "Sorry, something went wrong"
    end
  end
end
