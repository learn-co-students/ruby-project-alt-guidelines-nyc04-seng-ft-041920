class Ingredient < ActiveRecord::Base
    has_many :orders
end