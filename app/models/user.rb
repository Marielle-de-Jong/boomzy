class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, as: :addressable
  has_many :listings
  has_many :bookings
  has_one_attached :photo
  accepts_nested_attributes_for :address
end
