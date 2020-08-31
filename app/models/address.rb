class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  validates :city, presence: true
  validates :address_line_1, presence: true
  validates :postcode, presence: true
end
