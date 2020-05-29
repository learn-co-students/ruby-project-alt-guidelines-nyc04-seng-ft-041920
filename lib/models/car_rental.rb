class CarRental < ActiveRecord::Base
    has_many :bookings
    has_many :drivers, through: :bookings
   
    def self.view_car
        prompt = TTY::Prompt.new
        all = self.all.map do |car|
            "#{car.year} #{car.make} #{car.model} with #{car.horsepower}HP in a beautiful #{car.color} color."
        end
        result = prompt.select("Here's our collection", [all])

    end

    def self.select_car
        prompt = TTY::Prompt.new
        
        choice = prompt.select('What car would you like to rent?') do |car|
            car.choice 'Yellow 2020 Lamborghini Aventador SVJ', CarRental.find_by(model: "Aventador SVJ")
            car.choice 'Orange 2018 Mclaren 720S', CarRental.find_by(model: "720S")
            car.choice 'Purple 2019 Porsche GT3', CarRental.find_by(model: "GT3")
            car.choice 'Red 2015 Ferrari Laferrari', CarRental.find_by(model: "LaFerrari")
            car.choice 'Blue 2020 Bugatti Chiron', CarRental.find_by(model: "Chiron")
            car.choice 'Green 2017 Mercedes AMG GT', CarRental.find_by(model: "AMG GT")
            car.choice 'Grey 2018 Ferrari 812 Superfast', CarRental.find_by(model: "812 Superfast")
            car.choice 'Black 2020 Mercedes G63 AMG', CarRental.find_by(model: "G63 AMG")
            car.choice 'Black 2015 Rolls-Royce Wraith', CarRental.find_by(model: "Wraith")
            car.choice 'Silver 1965 Aston Martin DB5', CarRental.find_by(model: "DB5")
        end

        choice

          

    end

    



end