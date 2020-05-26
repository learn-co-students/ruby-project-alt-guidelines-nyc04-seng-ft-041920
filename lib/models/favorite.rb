class Favorite < ActiveRecord::Base
  belongs_to :user
  has_many :moods, through: :user
  has_many :recipes, through: :moods 
end

# another joined table, a user has a favorite and that
# favorite points to one recipe. 
# same relationship as moods 
# recipe and use has 
# multiple dif relationships with the same models/class

