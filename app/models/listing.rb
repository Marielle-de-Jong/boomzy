class Listing < ApplicationRecord
  has_many :skills
  belongs_to :user
end
