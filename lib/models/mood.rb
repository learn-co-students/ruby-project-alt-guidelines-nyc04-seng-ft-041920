class Mood < ActiveRecord::Base
  has_many :mood_recipes
  has_many :recipes, through: :mood_recipes
end

# A Mood has many Mood Recipes
# One mood has many recipes, which are associated to that
# mood through the mood recipes
