class User < ActiveRecord::Base
    has_many :orders
    has_many :couriers, through: :orders


    def self.find_email_address(email_address)
        User.find_by(emailaddress: email_address)
    end

    def self.find_password(password)
        User.exists?(password: password)
    end


    #ex.
    # def self.create_a_new_user
    #     prompt = TTY::Prompt.new 
    #     username = prompt.ask("What do you want your username to be?")
        
    #         if User.find_by(username: username)
    #          puts "Sorry, that name has already been taken"
    #         end
    #             User.create(username: username)  
        
        
    # end

    # def self.logging_someone_in
    #     prompt = TTY::Prompt.new 
    #     username = prompt.ask("What is your username?")
    #     found_user = User.find_by(username: username)
    #     if found_user
    #         return found_user
    #     else
    #         puts "Sorry, that name does not exist"
    #     end
    # end


end