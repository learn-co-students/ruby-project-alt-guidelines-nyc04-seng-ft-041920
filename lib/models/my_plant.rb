class MyPlant < ActiveRecord::Base
    belongs_to :user
    belongs_to :plant_list
    attr_reader :planed_date
    # t.string "nickname"
    # t.boolean "watered"
    # t.datetime "watering_date"
    # t.integer "plant_list_id"
    # t.integer "user_id"
    # t.integer "water_cycle"

    def self.add_plant(nickname, curr_user, new_plant)
        binding.pry
        watered = false
        cycle = new_plant.plant_list.water_cycle
        future_date = calculate_future_date(Date.today, cycle)
        MyPlant.create(nickname: nickname, watered: watered,watering_date: future_date, water_cycle: cycle,user_id: curr_user.id, plant_list_id: new_plant.id )
        # instance of myplant.plant_list.species
    end
    def find_my_plant(nicknames)
        MyPlant.find_by(nicknames: nicknames)
    end
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
        ["num","nickname","species","watered status", "last watering date","upcoming watering date"]
    end

    def show_each_plant_spec(index)
        answer = "yes" if self.watered
        binding.pry
        # upcoming_date = calculate_future_date(self.watering_date,self.water_cycle)
        # upcoming_date = self.watering_date.to_date + self.water_cycle.day
        [index,self.nickname, self.plant_list.species, self.watered, "#{answer}, #{days_between}days ago", calculate_future_date(self.watering_date,self.water_cycle)]
    end

    def calculate_days_between(last_watered_date)
        (Date.today - last_watered_date).to_i
    end
    def calculate_future_date(date, cycle)
        date = date.to_date
        cycle = cycle.day
        update = date+cycle
    end
end