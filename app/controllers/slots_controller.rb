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
    start_time = DateTime.strptime(params[:date], '%d/%m/%Y, %H:%M:%S')
    @slot = Slot.new(start_time: start_time, teacher_id: current_user.teacher.id)
    authorize @slot
    if @slot.save!
      redirect_to slots_path, notice: "The slot was created!"
    else
      redirect_to slots_path, notice: "Sorry, something went wrong"
    end
  end

  def update
    @slot = Slot.find(params[:id])
    authorize @slot
    if @slot.update(duration: params[:duration])
      redirect_to slots_path, notice: "The slot was updated!"
    else
      redirect_to slots_path, notice: "Sorry, something went wrong"
    end
  end

  def reserve
    @slot = Slot.find(params[:slot_id])
    authorize @slot
    if @slot.update(provisional: false) && @slot.bookings.destroy_all
      redirect_to slots_path, notice: "The slot was reserve!"
    else
      redirect_to slots_path, notice: "Sorry, something went wrong"
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

  def destroy
    @slot = Slot.find(params[:id])
    authorize @slot
    @slot.bookings.destroy_all
    if @slot.destroy
      redirect_to slots_path, notice: "The slot was deleted!"
    else
      redirect_to slots_path, notice: "Sorry, something went wrong" 
    end
  end
end
