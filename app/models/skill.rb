class Skill < ApplicationRecord
  belongs_to :meeting
  belongs_to :user_skill
end
