class Mood < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
end

# if something belongs to another class
# I have to have a references to that other thing.
