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
      if @booking.user == current_user
        redirect_to bookings_path, notice: "The booking was cancelled!"
      else
        redirect_to slots_path, notice: "The booking was cancelled!"
      end
    else
      redirect_to bookings_path, notice: "Sorry, something went wrong"
    end
  end

  def book_for_user
    @slot = Slot.find(params[:booking][:id])
    @booking = Booking.new(slot_id: @slot.id)
    authorize @booking
    user_id = params[:booking][:user_id]
    if @booking.update!(user_id: user_id)
      @slot.update!(provisional: false)
      redirect_to slots_path, notice: "Booking successfully created!"
    else
      redirect_to slots_path, notice: "Something went wrong"
    end
  end
end
