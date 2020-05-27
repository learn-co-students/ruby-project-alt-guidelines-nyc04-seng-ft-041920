class MyPlant < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant_list

    # t.string "nickname"
    # t.boolean "watered"
    # t.datetime "watering_date"
    # t.integer "plant_list_id"
    # t.integer "user_id"
    # t.integer "water_cycle"
   
    ## 
    # ADD new MyPlant
    ##
    def self.add_plant(nickname, curr_user, new_plant)
        #default data for new MyPlant
        watered = false
        future_date = Date.today.to_date

        MyPlant.create(
            nickname: nickname, 
            watered: watered,
            watering_date: future_date,
            water_cycle: new_plant.watering_cycle,
            user_id: curr_user.id,
            plant_list_id: new_plant.id 
            )
    end

    ## 
    # FIND new MyPlant
    ##
    def find_my_plant(nicknames)
        MyPlant.find_by(nicknames: nicknames)
    end

    ## 
    # Show ALL new MyPlant
    ##
    def self.nicknames
        MyPlant.all.collect{|plant| plant.nickname}
    end 

    def update_waterdate_status(date)
        self.update(watering_date: date.to_date)
        self.update(watered: true)
    end

    def change_watercycle(days)
        self.update(water_cycle: days)
    end

    def self.heading
        ["num","nickname","species","watering status","upcoming watering date"]
    end

    def show_each_plant_spec(index)
        
        # binding.pry
        days_between=calculate_days_between(self.watering_date.to_date)
        future_date =calculate_future_date(self.watering_date,self.water_cycle)
        self.watered ? status = "yes": status = "no"

###Check if watering was overdue

        [index, self.nickname, self.plant_list.species, "#{status}, #{days_between}", future_date]
    end

    def calculate_days_between(last_watered_date)
        # binding.pry
        if Date.today <= last_watered_date && self.watered == false
            return "should be watered TODAY"
        elsif Date.today <= last_watered_date && self.watered == true
            return "watered today"
        else
            "#{(Date.today - last_watered_date).to_i} days ago"
        end
    end
    def calculate_future_date(date, cycle)
        # binding.pry
        if self.watered

            date = date.to_date
            cycle = cycle.day
            update = date+cycle
        else
            return "Today is great day to water#{self.nickname}"
        end
    end


end