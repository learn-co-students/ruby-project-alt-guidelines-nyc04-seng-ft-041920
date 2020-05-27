class User < ActiveRecord::Base
    has_many :my_plants, dependent: :delete_all
    has_many :plant_lists, through: :my_plants

    # def initialize(username)
    #     @username = username
    # end
    def self.find_create_user(username_input)
                
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

    
    def find_plant(name)
       return PlantList.find_by(species: name)
    end

    def find_plant_nickname(nickname)
        return MyPlant.find_by(nickname: nickname)
    end
    
    def num_of_plants
        # binding.pry
        self.all_plants.length
    end
    # def nicknames
    #     binding.pry
    #     self.collect{|plant| plant.nickname}
    # end 

    def all_plants
        self.my_plants.all
        # Interface.main_menu(self)
    end
end