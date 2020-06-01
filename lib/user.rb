class User < ActiveRecord::Base
    has_many :agreements
    has_many :cars, through: :agreements

    def self.all_users # returns an array of all user instances in the database
      User.all.find do |user|
        user.id == self.user_id
      end            
    end
    
    def specific_user # takes in a name (string) as an argument. It should return the first instance of a user
      prompt = TTY::Prompt.new
      username = prompt.ask("Please log in")
      found_user = User.find_by(username: username)
    end

    # def specific_car # takes in a model (string) as an argument. It should return the first instance of a car with that model. 
      
    # end
    def self.change_age(user, new_age)# a method that is used on a user instance that takes in a new age (integer) as an argument. 
      # It should return that user instance with the updated age. 
      # This should save to the database.
      user.age = new_age     
      user.save
      end
    end

end