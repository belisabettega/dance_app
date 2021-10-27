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
end
