class Interface
    
    attr_accessor :prompt, :user, :order

    def initialize
        @prompt = TTY::Prompt.new
        @user = nil
        @order = nil
    end

    def art 
        puts "

███    ███ ██    ██ ███    ██  ██████ ██   ██ ███████ ███████ ███████ ██ 
████  ████ ██    ██ ████   ██ ██      ██   ██ ██      ██         ███  ██ 
██ ████ ██ ██    ██ ██ ██  ██ ██      ███████ █████   █████     ███   ██ 
██  ██  ██ ██    ██ ██  ██ ██ ██      ██   ██ ██      ██       ███       
██      ██  ██████  ██   ████  ██████ ██   ██ ███████ ███████ ███████ ██ 
                                                                         
".colorize(:blue)
sleep 1
    end
                                                                         

                                                                      


    def welcome
        puts "Got the Muncheez?!\n".colorize(:color => :blue)
        sleep 1
    end

    def login_prompt
        answer = prompt.select("Are you logging in or creating an account?",[
            "Login",
            "Create an account"
        ])
        if answer == "Login"
            login
        elsif answer == "Create an account"
            create_account
        end
    end

    
    def create_account
        email = prompt.ask("Email Address: ")
            while User.find_by(emailaddress: email) do
                puts "Sorry, that email has already been taken".colorize(:color => :yellow)
                self.create_account
            end
        password = prompt.ask("Password: ")
        binding.pry
        sleep 1
        username = prompt.ask('Name: ')
        sleep 1
        phone_number = prompt.ask('Phone Number: ')
        sleep 1
        address = prompt.ask('Current Location: ')   
        
        @user = User.create(name: username, emailaddress: email, phonenumber: phone_number, address: address, password: password)
        binding.pry
        self.delivery
    end

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
        puts "Oops! Looks like that password is incorrect. Try again.".colorize(:yellow)
        self.login
    end


    def login_failed
        answer = prompt.select("Sorry! We couldn't find a Muncheez account with that email. Would you like to create a new one?".colorize(:yellow), [
            "Yes",
            "No"
        ])
        answer == "Yes" ? self.create_account : self.login
    end


    def delivery
        answer = prompt.select("What are you craving?".colorize(:color => :blue), [
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
        answer = prompt.select("MUNCHEEZ!".colorize(:color => :blue), [
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
            "Omelette",
            "Go Back"
        ])
        if answer == "Go Back"
            delivery
        end
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end
        

    def burger
        answer = prompt.select("What would you like to order?", [
            "Classic Burger",
            "Cheese Burger",
            "Bacon Cheese Burger",
            "Go Back"
        ])
        if answer == "Go Back"
            delivery
        end
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def pizza
        answer = prompt.select("What would you like to order?", [
            "Cheese Pizza",
            "Pepperoni Pizza",
            "Hawaiian Pizza",
            "Go Back"
        ])
        if answer == "Go Back"
            delivery
        end
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def sandwich
        answer = prompt.select("What would you like to order?", [
            "Chicken Sandwich",
            "BLT",
            "Philly Cheese Steak",
            "Go Back"
        ])
        if answer == "Go Back"
            delivery
        end
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def salad
        answer = prompt.select("What would you like to order?", [
            "Ceasar Salad",
            "Pasta Salad",
            "Fruit Salad",
            "Go Back"
        ])
        if answer == "Go Back"
            delivery
        end
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end

    def dessert
        answer = prompt.select("What would you like to order?", [
            "Apple Pie",
            "Cheese Cake",
            "Frozen Yogurt",
            "Go Back"
        ])
        if answer == "Go Back"
            delivery
        end
        @order = Order.create(order: answer, user_id: @user.id)
        decision
    end
    

    def view_cart
        food = rand(20)
        tax = rand(5)
        delivery = rand(3)
        cents1 = rand(99)
        cents2 = rand(99)
        cents3 = rand(99)
        puts "\n"
        puts "Muncheez!".colorize(:blue)
        puts "#{@order.order} - $#{food}.#{cents1}"
        puts "Tax - $#{tax}.#{cents2}"
        puts "Delivery Fee - $#{delivery}.#{cents3}\n"
        answer = prompt.select("Would you like to edit, delete or place your order?".colorize(:blue), [
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
    
    def edit
        answer = prompt.ask("What would you like to edit?".colorize(:color => :blue))
        @order.order = "#{@order.order}, #{answer}"
        answer = prompt.select("Would you like to view your cart, delete or place your order?".colorize(:color => :blue), [
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


    def delete
        @order.destroy
        answer = prompt.select("Would you like to make a different order?".colorize(:color => :blue), [
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
        puts "Your order is on the way!".colorize(:color => :blue)
        puts "Muncheez: #{@order.order}"
        puts "Courier: #{@order.courier.name}"
        puts "Phone number: #{@order.courier.phonenumber}"
        puts "ETA: #{eta} min"
        system exit
    end
    
end


        
  



        
        
   
