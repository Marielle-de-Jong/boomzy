class Booking < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :location
  has_one :skill
  has_many :reviews
  belongs_to :listing

  validates :date, presence: true
  validates :status, presence: true
end
