class Meeting < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable
  has_one :skill

  validates :date, presence: true
  validates :status, presence: true
end
