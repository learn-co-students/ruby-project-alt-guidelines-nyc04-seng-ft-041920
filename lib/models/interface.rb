###########################
# Screen clearing module  #
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

    # attr_accessor :prompt
    @@prompt = TTY::Prompt.new(help_color: :green)
    # Add TTY-prompt
    def initialize
        
    end
    
    def greet
        Ascii.welcome_0
        sleep(0.7)
        self.clear
        Ascii.welcome_1
        sleep(0.7)
        self.clear
        Ascii.welcome_2        
        sleep(1.5)
        self.clear
        Ascii.image
        # puts 'Tell us your username'
    end

    # Start the CLI APP
    def run
        self.clear
        greet
        username_input = @@prompt.ask('Tell me your username: ',required: true)
        username_input = username_input.downcase
        user = User.find_create_user(username_input)
        main_menu(user)
    end

    # Main Menu -> My Plants/ Add plant/ Delete Account/ Quit
    def main_menu(user)
        user = user
        self.clear
        Ascii.image
        menu = ["See all my plants","Add new plant","Delete my account","Quit"]
        menu_selection = @@prompt.select("What would you like to do?",menu)
            
            case menu_selection
            when "See all my plants"
                my_plant(user)
            when "Add new plant"
                add_plant(user)
            when "Delete my account"
                answer = @@prompt.yes?("Are you sure?")
                answer == true ? user.destroy : self.main_menu(user)
            when "Quit"
                index = 0
                # binding.pry
                color = ["#7FFF00","#6B8E23","#008000","#2F4F4F","#00008B"]
                5.times do
                    self.clear
                    # binding.pry
                    puts Paint[Ascii.goodbye, color[index]] 
                    index += 1
                    sleep(0.7)
                end           
            end
    end

    #Sub-Menu: My Plants (displays all the plant user owns, leads to update them)
    def my_plant(user)
        self.clear
        Ascii.image
        show_my_plants_table(user)

        if user.all_plants.blank?
            menu = ["Add new plant","back"]
            menu_selection = @@prompt.select("Looks like you don't have any plants",menu)
            
            case menu_selection
            when "Add new plant"
                add_plant(user)
            when "back"
                main_menu(user)            
            end
        else
            menu = ["Water plant","Add new plant","Change nickname","Delete plants","back"]
            menu_selection = @@prompt.select("Select from below",menu)
            nicknames = user.my_plants.nicknames
            case menu_selection
            when "Water plant"
                
                nickname = @@prompt.select("Which plant did you water?", nicknames)
                selected_plant = user.find_plant_nickname(nickname)
                update_plant(selected_plant,user)
            when "Add new plant"
                add_plant(user)
            when "Change nickname"
                nickname = @@prompt.select("Which plant should we change?", nicknames)
                nickname = nickname.downcase
                selected_plant = user.find_plant_nickname(nickname)
                new_name = @@prompt.ask("Enter #{nickname.capitalize}'s new name:") do |q|
                            q.required true
                            q.modify :strip, :down
                            end
                selected_plant.update_nickname(new_name) 
                self.my_plant(user)
            when "Delete plants"
                nicknames = @@prompt.multi_select("Which plant should we remove?", nicknames)
                plants = user.find_plant_nicknames(nicknames)
                MyPlant.delete_plants(plants)
                self.my_plant(user)
            when "back"
                main_menu(user)            
            end
        end
    end

    #Sub-menu of My Plants: Updates watering status and cycle 
    def update_plant(selected_plant, user, menu_sel=nil)   
        menu = ["update watering status","change watering cycle","back"]
        menu_selection = @@prompt.select("options",menu)
        case menu_selection
        when "update watering status"
            # binding.pry
            date = get_date(selected_plant)
            date = date.to_date
            # binding.pry
            selected_plant.update_waterdate_status(date)
            my_plant(user)
        when "change watering cycle"
            days =  @@prompt.ask("Change #{selected_plant.nickname}'s watering cycle to every 'x' days?") do |q|
                q.required true
                q.validate /\d{1,2}/
                q.messages[:valid?] = "only numbers please"
                q.convert :int
            end
            selected_plant.change_watercycle(days)
            my_plant(user)
        when "back"
            my_plant(user)
        end
        
    end


    def self.ask_water_cycle(plant_name)
        puts Paint["\rnope we don't have that. let's create one\r",'#3CB371']
        watering_cycle =  @@prompt.ask("In how many days #{plant_name.capitalize} needs to be watered? (enter in numbers ex. 5)") do |q|
            q.required true
            q.validate /\d{1,2}/
            q.messages[:valid?] = "only numbers please" 
            q.convert :int
        end
        return watering_cycle
    end
    def get_date(selected_plant)
        date = @@prompt.ask("When did you water #{selected_plant.nickname.capitalize}?? today: #{Date.today.strftime("%m/%d")}(in mm/dd)")
        date = validate_past_date(date,selected_plant)
        date.class == Date ? date : binding.pry
        
    end
    def validate_past_date(date,selected_plant)
        
        parseable =  Date.parse(date) rescue false
        if parseable
            date = Date.parse(date).to_date
            if date <= Date.today
                return date
            else
                print Paint["\rDate must be today or past \r",'#3CB371']
                sleep 1
                self.get_date(selected_plant)
            end
        else
            print Paint["\rInvalid date format \r",'#3CB371']
            sleep 1
            self.get_date(selected_plant)
        end
        
    end
    def add_plant(user)
        user = user
        new_plant = @@prompt.ask("Enter a plant species you want to add:", help: "(ex. Lily, Mint, Spider plant etc.)", required: true)
        new_plant = PlantList.check_plant(new_plant)
        nickname = @@prompt.ask("Give a nickname to #{new_plant.species.capitalize}:") do |q|
                            q.required true
                            q.modify :strip, :down
                    end
        nickname =nickname.downcase
        MyPlant.add_plant(nickname, user, new_plant)
        # binding.pry
        my_plant(user)
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