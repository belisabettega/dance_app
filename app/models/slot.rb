class Slot < ApplicationRecord
  belongs_to :teacher
  has_many :bookings

  DURATION = [60, 80, 90]

  validates :duration, inclusion: { in: DURATION }
  delegate :user, to: :teacher

  def booked?
    !self.bookings.where(status: true).empty?
  end
end
