class Skill < ApplicationRecord
  belongs_to :booking
  belongs_to :user_skill
end
