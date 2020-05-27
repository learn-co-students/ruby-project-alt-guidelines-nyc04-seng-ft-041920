# Mood.destroy_all
# MoodRecipe.destroy_all
# Recipe.destroy_all
# Favorite.destroy_all
# User.destroy_all

# require "faker"

# # def seed_names
# # 3.times do
# # name = Faker::Name.unique.first_name
# # last = Faker::Name.unique.last_name
# # full_name = name + " " + last
# # username = name[0] + last
# # username.downcase!
# # User.create(username: username, name: full_name)
# # end
# # end
# #

# def seed_moods
#   moods = ["Unmotivated", "Romantic", "Calm / Chill"]
#   moods.each { |mood| Mood.create(mood: mood) }
# end

# seed_moods()

# def seed_recipe
#   recipe = [["Daily Warrior", "1 Banana 1 cup Blueberries (Wild), 2 Apples, 1/4
# cup Dates, 2 tbsp Peanut Butter, 2 tbsp [Almonds, Stevia Plant-Based
# Sweetener, Handful Spinach - Organic", "Feeling like you need motivation?
# Make yourself a Daily Warrior with fruits like blueberries which are known to
# improve mental health, and apples containing antioxidants, vitamin C, fiber,
# and several other nutrients that may boost heart, brain, and digestive health
# designed to help you push on through.You got this. You're a warrior!", 680],
#             ["Daily Happy", "1 Banana 1 cup Blueberries (Wild), 2 Apples, 1/4
# cup Dates, 2 tbsp Peanut Butter, 2 tbsp Almonds, Stevia Plant-Based
# Sweetener, Handful Spinach - Organic", "Feeling like you need
# motivation? Make yourself a Daily Warrior with fruits like
# blueberries which are known to improve mental health, and apples
# containing antioxidants, vitamin C, fiber, and several other
# nutrients that may boost heart, brain, and digestive health
# designed to help you push on through.You got this. You're a
# warrior!", 900], ["Daily Meal", "1 Banana 1 cup Blueberries (Wild),
# 2 Apples, 1/4 cup Dates, 2 tbsp
#     Peanut Butter, 2 tbsp Almonds, Stevia Plant-Based Sweetener, Handful
# Spinach -
#     Organic", "Feeling like you need motivation? Make yourself a Daily Warrior
# with
#     fruits like blueberries which are known to improve mental health, and
# apples
#     containing antioxidants, vitamin C, fiber, and several other nutrients that
# may
#     boost heart, brain, and digestive health designed to help you push on
# through.You
#     got this. You're a warrior!", 1200]]
#   recipe.each do |recipe|
#     Recipe.create(name_of_recipe: recipe[0], ingredients: recipe[1],
#                   description: recipe[2], calories: recipe[3])
#     # binding.pry
#   end
# end

# seed_recipe()

def seed_mood_recipes
  mood_ids = Mood.all.collect { |mood| mood.id }
  recipe_ids = Recipe.all.collect { |recipe| recipe.id }

  mood_ids.each_with_index do |m_id, i|
    MoodRecipe.create(mood_id: m_id)
    MoodRecipe.create(recipe_id: recipe_ids[i])
    binding.pry
  end
end

seed_mood_recipes()
# end

# moods = ["Unmotivated", "Romantic", "Calm / Chill"]

# 8 moods

# seed_mood_recipes()

puts "done seeing"
