class User < ActiveRecord::Base
    has_many :agreements
    has_many :cars, through: :agreements

    def all_users # returns an array of all user instances in the database
    end
    
    def specific_user # takes in a name (string) as an argument. It should return the first instance of a user
    end

    def specific_car # takes in a model (string) as an argument. It should return the first instance of a car with that model. Example would be
    end 

end