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


    def login_prompt
        answer = prompt.select("Are you loggin in or creating an account?",[
            "Login",
            "Create an account"
        ])
        if answer == "Login"
            login
        elsif answer == "Create an account"
            create_account
        end
    end


    # def login_prompt
    #     puts "Already have an account? (yes or no)"
    #     user_input = gets.chomp
    #     user_has_account?(user_input)
    # end

    # def user_has_account?(user_input)
    #     if user_input == "yes"
    #         login
    #     elsif user_input == "no"
    #         create_account
    #     # does not execute else    
    #     else
    #         "Please provide one of the following options."
    #         login_prompt
    #     end
    # end
    
    def create_account
        email = prompt.ask("What do you want your email to be?")
            while User.find_by(emailaddress: email) do
                puts "Sorry, that email has already been taken"
                self.create_account
            end
        password = prompt.ask("Create a password")
        sleep 1
        username = prompt.ask('What is your name?')
        sleep 1
        phone_number = prompt.ask('What is your phone number?')
        sleep 1
        address = prompt.ask('What is your home address?')   
        
        @user = User.create(name: username, emailaddress: email, phonenumber: phone_number, address: address, password: password)
        self.delivery
    end





    # def create_account
    #     puts "Create an account!"
    #     sleep 1
    #     puts "What is your name?"
    #     user_name = gets.chomp
    #     sleep 1
    #     puts "Email Address"
    #     email = gets.chomp
    #     sleep 1
    #     puts "Phone Number"
    #     phone_number = gets.chomp
    #     sleep 1
    #     puts "Home Address"
    #     address = gets.chomp
    #     sleep 1
    #     #Fix password so that it must be 8 characters long
    #     puts "Create Password."
    #     password = gets.chomp
    #     @user = User.create(name: user_name, emailaddress: email, phonenumber: phone_number, address: address, password: password)
    #     self.delivery
    # end
     
    def login
        email = prompt.ask("Please provide your email address?")
        match = User.find_by(emailaddress: email)
        
        if match
            password = prompt.ask("What is your password?")
            @user = match
             match.password == password ? self.delivery : self.incorrect_password
        else
            self.login_failed
        end
    end

    def incorrect_password
        puts "Oops! Looks like that password is incorrect. Try again."
        self.login
    end


    # def login
    #     puts "Email Address"
    #     email = gets.chomp
    #     match = User.find_by(emailaddress: email)
    #     if match
    #         puts "Password"
    #         password = gets.chomp
    #         @user = match
    #          match.password == password ? self.delivery : self.login_failed
    #     else
    #         self.login_failed
    #     end
    # end



    def login_failed
        answer = prompt.select("Sorry! We couldn't find a Muncheez account  with that email. Would you like to create a new one?", [
            "Yes",
            "No"
        ])
        answer == "Yes" ? self.create_account : self.login
    end


    # def login_failed 
    #     puts "Sorry! Your account does not exist. Would you like to create an account? (yes or no)"
    #     user_input = gets.chomp
    #     user_input == "yes" ? self.create_account : self.login
    # end


    def delivery
        answer = prompt.select("What are you craving?", [
            "Breakfast",
            "Burger",
            "Pizza",
            "Sandwich",
            "Salad",
            "Dessert"
        ])
        case answer
        when "Breakfast"
          breakfast
        when "Burger"
          burger
        when "Pizza"
          pizza
        when "Sandwich"
          sandwich
        when "Salad"
            salad
        when "Dessert"
            dessert
        end

    end

    def decision
        answer = prompt.select("Yum! Would you like to view your cart, edit, delete or place your order?", [
            "View Cart",
            "Edit",
            "Delete",
            "Place Order"
        ])
        case answer 
        when "View Cart"
            view_cart
        when "Edit"
            edit
        when "Delete"
            delete
        when "Place Order"
            place_order
        end
    end

    def breakfast
        answer = prompt.select("What would you like to order?", [
            "Pancakes",
            "French Toast",
            "Omelette"
        ])
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end
        

    def burger
        answer = prompt.select("What would you like to order?", [
            "Classic Burger",
            "Cheese Burger",
            "Bacon Cheese Burger"
        ])
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def pizza
        answer = prompt.select("What would you like to order?", [
            "Cheese Pizza",
            "Pepperoni Pizza",
            "Hawaiian Pizza"
        ])
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def sandwich
        answer = prompt.select("What would you like to order?", [
            "Chicken Sandwich",
            "BLT",
            "Philly Cheese Steak"
        ])
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def salad
        answer = prompt.select("What would you like to order?", [
            "Ceasar Salad",
            "Pasta Salad",
            "Fruit Salad"
        ])
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def dessert
        answer = prompt.select("What would you like to order?", [
            "Apple Pie",
            "Cheese Cake",
            "Frozen Yogurt"
        ])
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end
        
        

    # def delivery
    #     puts "What would you like to order?:"
    #     order = gets.chomp
    #     @order = Order.create(order: order, user_id: @user.id)
    #     binding.pry
    #     self.view_cart
    # end

    def view_cart
        food = rand(20)
        tax = rand(5)
        delivery = rand(3)
        cents1 = rand(99)
        cents2 = rand(99)
        cents3 = rand(99)
        puts "Would you like to edit, delete or place your order? \n \n"
        puts "Total:"
        puts "#{@order.order} - $#{food}.#{cents1}"
        puts "Tax - $#{tax}.#{cents2}"
        puts "Delivery Fee - $#{delivery}.#{cents3}"
        answer = prompt.select("", [
            "Edit",
            "Delete",
            "Place Order"
        ])
        case answer
        when "Edit"
            edit
        when "Delete"
            delete
        when "Place Order"
            place_order
        end
    end
    
    
    # def view_cart?
    #     food = rand(20)
    #     tax = rand(5)
    #     delivery = rand(3)
    #     cents1 = rand(99)
    #     cents2 = rand(99)
    #     cents3 = rand(99)
    #     puts "Would you like to edit or place your order? \n \n"
    #     puts "Total:"
    #     puts "#{@order.order} - $#{food}.#{cents1}"
    #     puts "Tax - $#{tax}.#{cents2}"
    #     puts "Delivery Fee - $#{delivery}.#{cents3}"
    #     user_input = gets.chomp
    #     if user_input == "edit"
    #         self.edit
    #     end
       
    #     if user_input == "order"
    #         self.place_order
    #     end
    # end

    def edit
        answer = prompt.ask("What would you like to edit?")
        @order.order = "#{@order.order}, #{answer}"
        answer = prompt.select("Would you like to view your cart, delete or place your order? ", [
            "View Cart",
            "Delete",
            "Place Order"
        ])
        case answer
        when "View Cart"
            view_cart
        when "Delete"
            delete
        when "Place Order"
            place_order
        end
    end

    # def edit?
    #     puts "What would you like to edit?"
    #     user_input = gets.chomp
    #     @order.order = "#{@order.order}, #{user_input}"
    #     binding.pry
    #     self.view_cart
    # end

    def delete
        @order.destroy
        answer = prompt.select("Would you like to make a different order?", [
            "Yes",
            "No"
        ])
        if answer == "Yes"
            delivery
        else
            system exit
        end
    end
        
        


    def place_order
        courier = Courier.all[rand(5)]
        @order.update(courier_id: courier.id)

        eta = rand(35)

        puts "Your order is on the way!"
        puts "Muncheez: #{@order.order}"
        puts "Courier: #{@order.courier.name} \nETA: #{eta} min"
        
  
    end



        
        
   
end
