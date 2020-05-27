class PlantList < ActiveRecord::Base
    has_many :my_plants
    has_many :users, through: :my_plants

    def self.find_plant(name)
        self.find_by(species: name)
    end

    def self.check_plant(plant_name)
        if find_plant(plant_name)
             found_plant = find_plant(plant_name) 
            puts "yup we have that"
            return found_plant
        else
            puts "nope we don't have that. let's create one"
            puts "do you know how in many days #{plant_name} needs to be watered?"
            puts "please enter in numbers"
            watering_cycle = gets.chomp.downcase
            new_plant=create_plant(plant_name ,watering_cycle)
            puts "thank you!"
            return new_plant
        end   
    end

    def self.create_plant(species,moisture_use= 'medium',watering_cycle=7)
        PlantList.create(species: species,moisture_use: moisture_use, watering_cycle: watering_cycle)
    end

end