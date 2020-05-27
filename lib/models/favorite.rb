class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
end

# another joined table, a user has a favorite and that
# favorite points to one recipe.
# same relationship as moods
# recipe and use has
# multiple dif relationships with the same models/class
