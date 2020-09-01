class ReworkReferencesForListingAndSkills < ActiveRecord::Migration[6.0]
  def change
    remove_reference :skills, :user
    add_reference :listings, :skill
  end
end
