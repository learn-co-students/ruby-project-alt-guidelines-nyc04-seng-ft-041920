class Agreement < ActiveRecord::Base
    belongs_to :user
    belongs_to :car

    def def create_rental_agreement # a method that takes in a car instance and a user instance as an argument.        
        # It should return an agreement instance that was created with both that car's id and that user's id
        self.map    
    end
    def all_rented_cars #is a method that takes in user instance as an argument. 
        # It should return an array of car instances that the user instance has rented       
    end
    def change_age # a method that is used on a user instance that takes in a new age (integer) as an argument. 
        # It should return that user instance with the updated age. 
        # This should save to the database.
    end
end