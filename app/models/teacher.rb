class Teacher < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :slots

  validates :description, :price, :address, presence: true
  validates :description, length: { in: 80..200 }
  validates :price, numericality: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  delegate :full_name, to: :user
end
