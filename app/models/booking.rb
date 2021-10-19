class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  delegate :start_time, :end_time, to: :slot
end
