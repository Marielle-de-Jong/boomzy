class Booking < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :skill
  has_many :reviews
  belongs_to :listing
  has_one :chatroom
  validates :date, presence: true
  validates :status, presence: true
end
