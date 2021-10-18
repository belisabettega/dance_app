class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_one :teacher

  validates :full_name, presence: true, length: { minimum: 2 }
  validates :full_name, format: { with: /[^A-Za-z0-9]+/, message: "only allows letters" }

  def is_a_teacher?
    !teacher.nil?
  end
end
