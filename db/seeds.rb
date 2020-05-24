require 'faker'
#USER
User.create(name: Faker::Name.unique.name)
User.create(name: Faker::Name.unique.name)

#INGREDIENTS
Ingredient.create(name: Faker::Food.unique.ingredient)
Ingredient.create(name: Faker::Food.unique.ingredient)
Ingredient.create(name: Faker::Food.unique.ingredient)
Ingredient.create(name: Faker::Food.unique.ingredient)
Ingredient.create(name: Faker::Food.unique.ingredient)

#RECIPES
Recipe.create(title: Faker::Food.unique.dish,  user_id: 1)

#UNITS
#SPLIT MEASUREMENT BY [0] = Amount :: [1] = name
split = Faker::Food.measurement.split(" ")

Unit.create(name: split[1])

binding.pry

#ORDERS
Order.create(1, 1, 1, split[0].to_f)
