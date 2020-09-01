class Listing < ApplicationRecord
  has_many :skills
  belongs_to :user
  has_many :bookings, through: :user
end
