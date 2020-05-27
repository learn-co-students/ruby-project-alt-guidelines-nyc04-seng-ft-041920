class Mood < ActiveRecord::Base
  has_many :mood_recipe
end

# happy = ["The Happy Smoothie", "Green Peace", "Daily Warrior" ]
# unmotivated = ["Daily Warrior", "Green Peace", "The Happy Smoothie"]
# romantic = ["Mint To Be", "Daily Warrior", "The Happy Smoothie"]

# if something belongs to another class
# I have to have a references to that other thing.

# t.string "name_of_recipe"
# t.string "ingredients"
# t.text "description"
# t.integer "calories"
