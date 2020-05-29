class Booking < ActiveRecord::Base
    belongs_to :driver
    belongs_to :car_rental


    def self.create_booking
        select_car = CarRental.select_car
        
        prompt = TTY::Prompt.new
        answer = prompt.yes?("Are you sure?",[select_car])
        if answer
            puts "Great your booking is now created. Great choice!"
        else
            puts "Booking not created, try again"
        end

    end


    
end