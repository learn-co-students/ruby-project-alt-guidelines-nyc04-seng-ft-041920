class CommandLineInterface

    def greet
        puts 'Thinking of florishing your house with some green but not sure to keep it alive? We can help you with that!'
        puts 'Welcome to Green Fairy ^-^ The best scheduler for watering your plants!'
        puts 'Let\'s get you started'
        puts 'Tell us your username :)'
    end
    
    def run
        greet
        username_input = gets.chomp.downcase
        find_create_user(username_input)
    end

    def add_plant
        puts "Enter a plant species you want to add: (ex: Lily, Mint, Spider plant etc.)"
        plant_name = gets.chomp.downcase
        check_plant(plant_name)
        # What could we put here to allow a user to type a response?
        found_plant = PlantList.find_by(species: plant_name)
    end

    def check_plant(plant_name)
        if find_plant(plant_name)
            find_plant(plant_name) 
            puts "yup we have that"
        else
            puts "nope we don't have that. let's create one"
            puts "do you know how many time #{plant_name} needs to be watered per week?"
            puts "please enter in numbers"
            watering_cycle = gets.chomp.downcase
            create_plant(plant_name ,watering_cycle)
            puts "thank you!"
        end
            
    end

    def find_plant(plant_name)
        PlantList.find_by(species: plant_name)
    end

    def create_plant(species,moisture_use= 'medium',watering_cycle)
        PlantList.create(species: species,moisture_use: moisture_use, watering_cycle: watering_cycle)
    end


    def find_create_user(username_input)
        loading(15, "*", 0.1)
        # system "clear" or system "cls"
        
        user = User.find_by(username: username_input)
        # binding.pry
        if user
           puts "Welcome back #{user.username.capitalize}! "
        else
          user = User.create(username: username_input)
          puts "Nice to meet you #{user.username.capitalize}!"        
        end
        return user
    end 
    # puts "What is your plant name you need to water or planing to?"
    def loading(length, sym, timing)
        length.times do |a|
          print sym
          sleep(timing)
        end
        puts ""
    end

end