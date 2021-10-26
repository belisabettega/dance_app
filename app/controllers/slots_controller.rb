class SlotsController < ApplicationController
  def index
    @slots = policy_scope(Slot)
    @slot = Slot.new
  end

  def new
    @slot = Slot.new
    authorize @slot
  end

  def create
    start_time = DateTime.parse(params[:date])
    @slot = Slot.new(start_time: start_time, teacher_id: current_user.teacher.id)
    authorize @slot
    if @slot.save
      redirect_to slots_path, notice: "The slot was created!"
    else
      redirect_to slots_path, notice: "Sorry, something went wrong"
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

  def bookable
    @slot = Slot.find(params[:slot_id])
    authorize @slot
    if @slot.update(provisional: true)
      redirect_to slots_path, notice: "The slot is now bookable!" 
    else
      redirect_to slots_path, notice: "Sorry, something went wrong" 
    end
  end

  def change
    @slot = Slot.find(params[:slot_id])
    authorize @slot
  end

end
