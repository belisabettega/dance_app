class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  delegate :start_time, :duration, :teacher, to: :slot

  def cancel_booking
    self.update(status: false)
    self.slot.update(provisional: true)
  end
end
