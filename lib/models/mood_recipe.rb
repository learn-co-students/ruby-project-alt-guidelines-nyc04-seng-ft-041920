class MoodRecipe < ActiveRecord::Base
  belongs_to :mood
  belongs_to :recipe
end
