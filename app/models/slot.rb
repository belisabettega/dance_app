class Slot < ApplicationRecord
  belongs_to :teacher
  has_many :bookings

  DURATION = [60, 90, 120]

  validates :duration, inclusion: { in: DURATION }
  delegate :user, to: :teacher

  def booked?
    self.provisional == false && !self.bookings.where(status: true).empty?
  end

  def reserved?
    self.provisional == false
  end

  def booking_active
    self.bookings.where(status: true).first
  end

  def number_of_slots
    if self.duration == 60
      4
    elsif self.duration == 90
      6
    else
      8
    end
  end

  def student
    self.booking_active.user
  end
end
