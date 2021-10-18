class Teacher < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :description, :price, :address, presence: true
  validates :description, length: { in: 80..150 }
end
