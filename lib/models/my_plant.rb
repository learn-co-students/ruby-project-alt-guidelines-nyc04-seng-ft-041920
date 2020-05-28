class MyPlant < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant_list
    attr_accessor :reserved_date

    # t.string "nickname"
    # t.boolean "watered"
    # t.datetime "watering_date"
    # t.datetime "reserved_date"
    # t.timestamp
    # t.integer "plant_list_id"
    # t.integer "user_id"
    # t.integer "water_cycle"
   
    ###########
    # Create  #
    ###########
    def self.add_plant(nickname, curr_user, new_plant)
        #default data for new MyPlant
        watered = false
        watering_date = nil
        nickname = nickname.downcase
        MyPlant.create(
            nickname: nickname, 
            watered: watered,
            watering_date: watering_date,
            reserved_date: nil,
            water_cycle: new_plant.watering_cycle,
            user_id: curr_user.id,
            plant_list_id: new_plant.id 
            )
    end

    ###########
    # Read    #
    ###########
    def find_my_plant(nicknames)
        MyPlant.find_by(nicknames: nicknames)
    end

    
    def self.nicknames
        MyPlant.all.collect{|plant| plant.nickname.capitalize}
    end 

    ###########
    # Update  #
    ###########
    def update_waterdate_status(date)
        self.update(watering_date: date.to_date)
        self.update(reserved_date: date.to_date + self.water_cycle.day)
        self.update(watered: true)
    end

    def update_nickname(new_name)
        # binding.pry
        new_name = new_name.downcase
        self.update(nickname: new_name)
    end

    def change_watercycle(days)
        self.update(water_cycle: days)
    end
    ###############################
    # Generate row data for table #
    ###############################
    def self.heading
        ["num","nickname","species","watering status","upcoming watering date"]
    end

    def show_each_plant_spec(index)   
        ###Check if watering status and return message
        water_msg = check_water_status
        future_msg =calculate_future_date(self.watering_date,self.water_cycle).last

        [index, self.nickname.capitalize, self.plant_list.species.capitalize, water_msg, future_msg]
    end

    def self.delete_plants(plants)
        ids = plants.map do |plant|
            plant.id
        end
        MyPlant.delete(ids)
    end
    
    def check_water_status
        today = Date.today
        self.watered ? status = "Yes": status = "No"
        last_watered_date = self.watering_date.to_date if self.watering_date != nil
        future_date = calculate_future_date(self.watering_date,self.water_cycle).first


        #Not watered and just created
        if self.watering_date == nil && self.watered==false
            #binding.pry
            return "#{status}, just added today"
        #Not watered and since created
        elsif self.watering_date == nil && self.watered==false && today > self.created_at
            #binding.pry
            return "#{status}, never waterd since added"
        #Passed Due date
        elsif self.watering_date != nil && self.watered==false && (today > future_date)
            #binding.pry
            return "#{status}, #{(today - future_date).to_i} days overdue!"
        #Passed Due date - by changing date too far
        elsif self.watering_date != nil && self.watered==true && (today > future_date)
            #binding.pry
            self.update(watered: false)
            status = "No"
            return "!!#{status}, passed #{(today - future_date).to_i} days"
        #Have watered and still not due date
        elsif self.watering_date != nil && self.watered==true && (today < future_date)
            #binding.pry
            return "#{status}, watered #{(today - last_watered_date).to_i} days ago"
        #Due tomorrow
        elsif self.watering_date != nil && self.watered==true && (today == future_date-1)
            #binding.pry
            return "#{status}, should water tomorrow!"#water #{(today - last_watered_date).to_i} days ago
            self.update(watered: false)
        #Due water today
        elsif self.watering_date != nil && self.watered==false && (today == future_date)
            #binding.pry
            return "Due today"
        #Just water today
        elsif self.watering_date != nil && self.watered==true && (today == self.created_at)
            #binding.pry
            return "Just watered today"
            # self.update(watered: false)
        #To catch bug 
        else
            binding.pry
            return "what case is this???"
        end

    end

    def calculate_future_date(date, cycle)
        future_date = []
        if self.watering_date == nil
            future_date << "*"
            # return "*"
            return future_date
        else
            date = date.to_date
            cycle = cycle.day
            update = (date+cycle)
            future_date << update
            future_date << "I'd say now" if update < Date.today
            return future_date
        end
    end
end