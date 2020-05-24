class User
    has_many :my_plants
    has_many :plant_lists, through: :my_plants
end