class User < ActiveRecord::Base
    has_many :my_plants, dependent: :delete_all
    has_many :plant_lists, through: :my_plants

    def self.find_create_user(username_input)
                
        user = User.find_by(username: username_input)
        if user
           puts "Welcome back #{user.username.capitalize}! "
        else
          user = User.create(username: username_input)
          puts "Nice to meet you #{user.username.capitalize}!"        
        end
        return user
    end 

    
    def find_plant(name)
       return PlantList.find_by(species: name)
    end

    def find_plant_nickname(nickname)
        nickname = nickname.downcase
        return MyPlant.find_by(nickname: nickname)
    end
    
    def num_of_plants
        self.all_plants.length
    end

    def all_plants
        self.my_plants.all
    end
end