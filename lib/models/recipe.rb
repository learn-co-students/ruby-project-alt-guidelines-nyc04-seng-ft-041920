class Recipe < ActiveRecord::Base
  has_many :moods
  has_many :users, through: :moods
end
# belongs to association , the belongs to part 
# has a foreign key 
