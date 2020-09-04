class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, as: :addressable
  has_many :listings, dependent: :destroy
  has_many :bookings
  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills
  has_one_attached :photo
  accepts_nested_attributes_for :address
  acts_as_token_authenticatable

  def has_socials?
    if linkedin_link || twitter_link || instagram_link || facebook_link
      return true
    end
  end
end
