class SlotsController < ApplicationController
  def index
    @slots = policy_scope(Slot)
    @slot = Slot.new
    @avaliable_slots = Slot.all.where(teacher_id: current_user.teacher.id, provisional: false).where("start_time >= ?", DateTime.now)
    @bookings = Booking.all.where(slot: @avaliable_slots, status: true)
  end

  def new
    @slot = Slot.new
    authorize @slot
  end

  def create
    @slot = Slot.new(slot_params)
    authorize @slot
    @slot.teacher_id = current_user.teacher.id
    if @slot.save
      respond_to do |format|
      format.js
      # format.html { redirect_to slots_path, notice: "The slot was created!" }
      end
    else
      respond_to do |format|
        format.html { render 'index' }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end

    end

  def reserve
    @slot = Slot.find(params[:slot_id])
    authorize @slot
    if @slot.update(provisional: false) && @slot.bookings.map(&:cancel_booking)
      respond_to do |format|
        format.js
        format.html { redirect_to slots_path, notice: "The slot was reserve!" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to slots_path, notice: "Sorry, something went wrong" }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:start_time, :duration)
  end
end
