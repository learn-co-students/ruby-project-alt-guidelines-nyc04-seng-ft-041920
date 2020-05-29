class Driver < ActiveRecord::Base
    has_many :bookings
    has_many :car_rentals, through: :bookings
    
    def self.create_account
        prompt = TTY::Prompt.new
        name = prompt.ask("What is your first and last name?")
        if name.split.length < 2
            puts "Please make sure you've entered your first and last name"
            return
        elsif 
            age = prompt.ask("How old are you #{name.split[0]}?")
            if age.to_i < 21
                puts "Sorry you're too young to rent, come back when you're 21"
                return 
            end

            username = prompt.ask("What would you like your username to be?")
        end
        Driver.create(full_name: name, age: age, user_name: username)
    end

    def self.existing_acct
        prompt = TTY::Prompt.new
        username = prompt.ask("What's you username?")
        found_user = Driver.find_by(user_name: username)

        if found_user
            "Welcome back #{found_user.full_name.split[0]}!" 
            found_user             
        else
            puts "Sorry we couldn't find that, try again!"
        end
    end

  



end