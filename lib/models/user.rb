class User < ActiveRecord::Base
    has_many :my_plants
    has_many :plant_lists, through: :my_plants

    # def initialize(username)
    #     @username = username
    # end

    def find_plant(name)
        PlantList.find_by(species: name)
    end
    def add_plant(nickname, plant_name )
        MyPlant.create(nickname: nickname, user_id: self.id, plant_list_id: find_plant(plant_name).id )
    end

    def all_plants
        self.my_plants.all
    end
end