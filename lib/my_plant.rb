class MyPlant < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant_list
    
end