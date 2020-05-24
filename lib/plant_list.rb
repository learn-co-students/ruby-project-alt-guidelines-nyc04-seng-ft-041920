class PlantList < ActiveRecord::Base
    has_many :my_plants
    has_many :users, through: :my_plants
end