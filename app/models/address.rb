class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  validates :city, presence: true
  validates :address_line_1, presence: true
  validates :postcode, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{address_line_1}, #{postcode} #{city}"
  end
end

# way TAs created address that actually was geocodable
# Address.create!(address_line_1: "Elandsgracht 86", postcode: "1016TZ", city: "Amsterdam", addressable_type: "User", addressable_id: User.first.id)
