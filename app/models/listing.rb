class Listing < ApplicationRecord
  has_many :skills
  belongs_to :user
  has_many :bookings, :dependent => :delete_all
end
