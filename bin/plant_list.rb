class PlantList
    has_many :my_plants
    has_many :users, through: :my_plants
end