class Slot < ApplicationRecord
  belongs_to :teacher

  DURATION = [60, 80, 90]

  validates :duration, inclusion: { in: DURATION }
end
