class Skill < ApplicationRecord
  belongs_to :user, optional: true
  has_many :listings
  accepts_nested_attributes_for :listings
end
