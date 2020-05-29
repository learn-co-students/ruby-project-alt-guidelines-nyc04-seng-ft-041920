class User < ActiveRecord::Base
    has_many :my_plants, dependent: :delete_all
    has_many :plant_lists, through: :my_plants

    def self.find_create_user(username_input)
                
        user = User.find_by(username: username_input)
        if user
           puts Paint["welcome back #{user.username.capitalize}!", '#3CB371']
           sleep 1
        else
          user = User.create(username: username_input)
          puts Paint["happy to meet you #{user.username.capitalize}!", '#3CB371']  
          sleep 1      
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

    def find_plant_nicknames(nicknames)
        index = 0
        found_plants = []
        nicknames.count.times do
            nickname = nicknames[index].downcase
            found_plants << MyPlant.find_by(nickname: nickname)
            index += 1
        end
        return found_plants
    end
    
    def num_of_plants
        self.all_plants.length
    end

    def all_plants
        self.my_plants.all
    end
end