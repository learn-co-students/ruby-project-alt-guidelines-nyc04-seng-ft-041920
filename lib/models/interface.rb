class Interface
    
    attr_accessor :prompt, :user, :order

    def initialize
        @prompt = TTY::Prompt.new
        @user = nil
        @order = nil
    end


    def welcome
        puts "Welcome to Muncheez!"
        sleep 1
    end
    
    #ex.
    # def login_or_register
    #     answer = prompt.select("Are you logging in or registering?", [
    #         "Logging in",
    #         "Registering"
    #     ])
    #     if answer == "Logging in"
    #         User.logging_someone_in
    #     elsif answer == "Registering"
    #         User.create_a_new_user
    #     end
    # end

    # def main_menu
    #     puts "Hello, welcome to the app #{user.username}"
    # end


    def login_prompt?
        answer = prompt.select("Are you loggin in or creating an account?",[
            "Login",
            "Create an account"
        ])
        if answer == "Login"
            login
        elsif answer == "Create an account"
            create_account
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
        # does not execute else    
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
        #Fix password so that it must be 8 characters long
        puts "Create Password."
        password = gets.chomp
        @user = User.create(name: user_name, emailaddress: email_address, phonenumber: phone_number, address: address, password: password)
        self.delivery
    end
   
    def login
        puts "Email Address"
        email_address = gets.chomp
        match = User.find_email_address(email_address)
        if match
            puts "Password"
            password = gets.chomp
            @user = match
             match.password == password ? self.delivery : self.login_failed
        else
            self.login_failed
        end
    end

    def login_failed 
        puts "Sorry! Your account does not exist. Would you like to create an account? (yes or no)"
        user_input = gets.chomp
        user_input == "yes" ? self.create_account : self.login
    end

    def delivery
        puts "What would you like to order?:"
        order = gets.chomp
        @order = Order.create(order: order, user_id: @user.id)
        binding.pry
        self.view_cart
    end
    
    
    def view_cart
        puts "Would you like to edit or place your order?"
        user_input = gets.chomp
        if user_input == "edit"
            self.edit
        end
       
        if user_input == "order"
            self.place_order
        end
    end

    def edit
        puts "What would you like to edit?"
        user_input = gets.chomp
        @order.order = user_input
        self.view_cart
    end


    def place_order
        courier = Courier.all[rand(5)]
        @order.update(courier_id: courier.id)

        eta = rand(35)

        puts "Your order is on the way!"
        puts "#{@order.order} mmmmmmm delicous!"
        puts "Courier: #{@order.courier.name} ETA: #{eta} min."
        
  
    end



        
        
   
end
