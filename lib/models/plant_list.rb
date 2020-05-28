class PlantList < ActiveRecord::Base
    has_many :my_plants
    has_many :users, through: :my_plants

    def self.find_plant(name)
        self.find_by(species: name)
    end

    def self.check_plant(plant_name)
        if find_plant(plant_name)
             found_plant = find_plant(plant_name) 
            puts "\ryup we have that\r"
            sleep 1
            return found_plant
        else
            puts "\rnope we don't have that. \n\rlet's create one\r"
            puts "In how many days #{plant_name} needs to be watered? (ex. 5)"
            puts "\rplease enter in numbers\r"
            watering_cycle = gets.chomp.downcase
            new_plant=create_plant(plant_name ,watering_cycle)
            puts "\rthank you!\r"
            sleep 1
            return new_plant
        end   
    end

    def self.create_plant(species,watering_cycle=7,moisture_use= 'medium')
        PlantList.create(
            species: species,
            moisture_use: moisture_use, 
            watering_cycle: watering_cycle
            )
    end

end