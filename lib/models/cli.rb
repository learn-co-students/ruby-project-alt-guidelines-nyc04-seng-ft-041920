class CommandLineInterface
    
    def run
        greet
        login_prompt
    end

    def greet
        puts "Welcome to Munchy!"
        sleep 2
    end

    def login_prompt
        puts "Already have an account? (yes or no)"
        user_input = gets.chomp
        user_has_account?(user_input)
    end

    def user_has_account?(user_input)
        if user_input == "yes"
            login
        elsif user_input == "no"
            create_account
        else
            "Please provide one of the following options."
            login_prompt
        end
    end

    def create_account
        puts "Create an account!"
        sleep 1
        puts "What is your name?"
        user_name = gets.chomp
        sleep 1
        puts "Email Address"
        email_address = gets.chomp
        sleep 1
        puts "Phone Number"
        phone_number = gets.chomp
        sleep 1
        puts "Home Address"
        address = gets.chomp
        sleep 1
        puts "Create Password. Must be 8 characters long."
        password = gets.chomp
        User.create(name: user_name, emailaddress: email_address, phonenumber: phone_number, address: address, password: password)
    end
   
    def login
        puts "Email Address"
        email_address = gets.chomp
        if User.find_email_address(email_address) == true
            puts "Password"
            password = gets.chomp
            User.find_password(password) == true ? self.food_order : self.login_failed
        else
            self.login_failed
        end
    end

    def login_failed 
        puts "Sorry! Your account does not exist. Would you like to create an account? (yes or no)"
        user_input = gets.chomp
        user_input == "Yes" ? self.create_account : self.login
    end

    def food_order
        puts "What would you like to order?"
    end



        
        
   
end
