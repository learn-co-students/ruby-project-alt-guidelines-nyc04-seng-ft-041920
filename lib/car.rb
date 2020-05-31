class Car < ActiveRecord::Base
has_many :agreements
has_many :users, through: :agreements

  def all_cars # returns an array of all car instances in the database
      self.cars.all    
  end

  def all_cars_details # is a method that returns an array of strings, 
    # each string describing a car in the database.
    self.cars.map do |car|
      car.color
      car.make
      car.model
    end
    puts [ "This is a #{color} #{make} #{model}" ].join(", ")
  end
end