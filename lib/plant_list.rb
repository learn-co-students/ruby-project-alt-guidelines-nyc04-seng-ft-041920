class PlantList < ActiveRecord::Base
    has_many :my_plants
    has_many :users, through: :my_plants

    def self.find_plant(name)
        self.find_by(species: name)
    end
end