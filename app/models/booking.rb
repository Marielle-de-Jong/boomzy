class Booking < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable
  has_one :skill
  has_many :reviews

  validates :date, presence: true
  validates :status, presence: true
end
