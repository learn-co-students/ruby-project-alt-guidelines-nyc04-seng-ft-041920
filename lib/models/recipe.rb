class Recipe < ActiveRecord::Base
  has_many :mood_recipes
  has_many :favorites
  has_many :moods, through: :mood_recipes
  has_many :users, through: :favorites
end

# A recipe has many users
# A recipe has many users through their favorites
# belongs to association , the belongs to part
# has a foreign key
