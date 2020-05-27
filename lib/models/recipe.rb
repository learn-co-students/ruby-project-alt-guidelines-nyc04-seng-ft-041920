class Recipe < ActiveRecord::Base
  has_many :mood_recipes
end

# belongs to association , the belongs to part
# has a foreign key
