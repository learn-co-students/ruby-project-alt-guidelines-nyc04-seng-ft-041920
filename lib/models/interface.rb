###########################
# Screem clearing module  #
###########################

module Screen
    def clear
        print "\e[2J\e[f"
    end

    def erase
        system 'clear'
    end
end

###########################
# Interface class for CLI #
###########################
class Interface
    include Screen

    attr_accessor :prompt

    # Add TTY-prompt
    def initialize
        @prompt = TTY::Prompt.new
    end
    
    def greet
        
        puts 'Welcome to Green Fairy 🧚'
        puts 'The best scheduler for watering your plants!'
        puts 'Let\'s get you started'
        image
        puts 'Tell us your username 📛'
    end

    # Start the CLI APP
    def run
        self.clear
        greet
        username_input = gets.chomp.downcase
        # self.loading(30, "~", 0.1)
        user = User.find_create_user(username_input)
        main_menu(user)
    end

    # Main Menu -> My Plants/ Add plant/ Delete Account/ Quit
    def main_menu(user)
        user = user
        self.clear
        image
        menu = ["See all my plants","Add new plant","Delete my account","Quit"]
        menu_selection = @prompt.select("What would you like to do?",menu)
            
            case menu_selection
            when "See all my plants"
                my_plant(user)
            when "Add new plant"
                add_plant(user)
            when "Delete my account"
                answer = @prompt.yes?("Are you sure?")
                self.goodbye
                user.destroy
            when "Quit"
                # self.goodbye                
            end
    end

    #Sub-Menu: My Plants (displays all the plant user owns, leads to update them)
    def my_plant(user)
        self.clear
        show_my_plants_table(user)

        if user.all_plants.blank?
            # puts "Looks like you don't have any plants"
            # answer = @prompt.yes?("Do you want to add plants?")
            # case answer
            # when true
            #     add_plant(user)
            # when false
            #     main_menu(user)
            # end
            menu = ["Add new plant","back"]
            menu_selection = @prompt.select("Looks like you don't have any plants",menu)
            
            case menu_selection
            when "Add new plant"
                add_plant(user)
            when "back"
                main_menu(user)            
            end
        else
            # answer = @prompt.yes?("Have you watered any of your plants?")
            # # answer = @prompt.yes?("Do you want to add plants?")
            # case answer
            # when true
            #     nicknames = user.my_plants.nicknames
            #     nickname = @prompt.select("Which plant did you water?", nicknames)
            #     binding.pry
            #     selected_plant = user.find_plant_nickname(nickname)
            #     binding.pry
            #     update_plant(selected_plant,user)
            # when false
            #     main_menu(user)
            # end
            menu = ["Water plant","Add new plant","Change nickname","back"]
            menu_selection = @prompt.select("Select from below",menu)
            nicknames = user.my_plants.nicknames
            case menu_selection
            when "Water plant"
                
                nickname = @prompt.select("Which plant did you water?", nicknames)
                # binding.pry
                selected_plant = user.find_plant_nickname(nickname)
                # binding.pry
                update_plant(selected_plant,user)
            when "Add new plant"
                add_plant(user)
            when "Change nickname"
                nickname = @prompt.select("Which plant should we change?", nicknames)
                nickname = nickname.downcase
                selected_plant = user.find_plant_nickname(nickname)
                new_name = @prompt.ask("Enter #{nickname}'s new name:")
                # binding.pry
                new_name = new_name.downcase
                selected_plant.update_nickname(new_name) 
                # self.clear
                # show_my_plants_table(user)
                self.my_plant(user)
            when "back"
                main_menu(user)            
            end
        end
    end
    #Sub-menu of My Plants: Updates watering status and cycle 
    def update_plant(selected_plant, user, menu_sel=nil)   
        menu = ["update watering status","change watering cycle","back"]
        menu_selection = @prompt.select("options",menu)
        case menu_selection
        when "update watering status"
            # binding.pry
            date = get_date(selected_plant)
            date=date.to_date
            # binding.pry
            selected_plant.update_waterdate_status(date)
            my_plant(user)
        when "change watering cycle"
            days =  @prompt.ask("Change #{selected_plant.nickname}'s watering cycle to every 'x' days?", convert: :int)
            selected_plant.change_watercycle(days)
            
            #==============================>show table
            my_plant(user)
        when "back"
            main_menu(user)
        end
        
    end
    def get_date(selected_plant)
        date = @prompt.ask("when did you water #{selected_plant.nickname}? Today is #{Date.today}(in mm/dd)")
        date = validate_past_date(date,selected_plant)
        date.class == Date ? date : binding.pry
        
    end
    def validate_past_date(date,selected_plant)
        parseable =  Date.parse(date) rescue false
        if parseable
            date = Date.parse(date).to_date
            if date < Date.today
                return date
            else
                puts "Date must be today or past"
                self.get_date(selected_plant)
            end
        else
            puts "Invalid date format"
            self.get_date(selected_plant)
        end
        
    end
    def add_plant(user)
        user = user
        new_plant = @prompt.ask("Enter a plant species you want to add: (ex: Lily, Mint, Spider plant etc.)?")
        # puts "Enter a plant species you want to add: (ex: Lily, Mint, Spider plant etc.)"
        # plant_name = gets.chomp.downcase
        new_plant = PlantList.check_plant(new_plant)
        nickname = @prompt.ask("Give a nickname to #{new_plant.species}:")
        MyPlant.add_plant(nickname, user, new_plant)
        main_menu(user)
    end
    
    

    def updated_my_plants_table(user)
        rows = user.all_plants.map.with_index{|plant, index| my_plant_list(plant,index+1)}
        headings = default_table_headings
        table = create_display_table("My Plants", headings, rows)
        table.style = default_table_style
        table.align_column(0, :left)
        puts table
    end

    ###########################
    # Table Related functions #
    ###########################

    # Default table setup and settings
    def create_display_table(title, headings, rows)
        Terminal::Table.new :title=> title, :headings => headings, :rows => rows
    end
    # Table Style 
    def default_table_style
        {:alignment => :center, :padding_left => 2, :border_x => "=", :border_i => "+"}
    end

    # Set table heading
    def default_table_headings
        MyPlant.heading
    end

    # Get data from curr_user's MyPlant
    def my_plant_list(my_plant, index)
        my_plant.show_each_plant_spec(index)
    end

    # Render Table
    def show_my_plants_table(user)
        rows = user.all_plants.map.with_index{|plant, index| my_plant_list(plant,index+1)}
        # binding.pry
        rows = [["*","*","*","*","*"]] if rows.empty?
        headings = default_table_headings
        # binding.pry
        table = create_display_table("#{user.username.capitalize}'s Plants", headings, rows)
        table.style = default_table_style
        table.align_column(0, :left)
        puts table
    end

    ##################################
    ##loading and good bye function ##
    ##################################
    def loading(length, sym, timing)
        length.times do |a|
          print sym
          sleep(timing)
        end
        puts ""
    end

    def image
                                                                                                                                                     
    puts "
   
        ░██████╗░██████╗░███████╗███████╗███╗░░██╗  
        ██╔════╝░██╔══██╗██╔════╝██╔════╝████╗░██║  
        ██║░░██╗░██████╔╝█████╗░░█████╗░░██╔██╗██║  
        ██║░░╚██╗██╔══██╗██╔══╝░░██╔══╝░░██║╚████║  
        ╚██████╔╝██║░░██║███████╗███████╗██║░╚███║  
        ░╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚══╝  
        
                    ███████╗░█████╗░██╗██████╗░██╗░░░██╗
         _ _  __    ██╔════╝██╔══██╗██║██╔══██╗╚██╗░██╔╝
        ( | )/_/    ██╔════╝██╔══██╗██║██╔══██╗╚██╗░██╔╝
     __( >O< )      █████╗░░███████║██║██████╔╝░╚████╔╝░
     \\_\\(_|_)       ██╔══╝░░██╔══██║██║██╔══██╗░░╚██╔╝░░
                    ██║░░░░░██║░░██║██║██║░░██║░░░██║░░░
                    ╚═╝░░░░░╚═╝░░╚═╝╚═╝╚═╝░░╚═╝░░░╚═╝░░░ 
    "
    end

    def goodbye
        self.clear
        length = 30
        sym = "*"
        timing =0.1

        length.times do |a|
          print sym
          sleep(timing)
        end
        puts "bye bye"
    end
    
    
end