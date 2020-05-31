class Interface

  attr_accessor :prompt, :user, :car  
  def initialize
    @prompt = TTY::Prompt.new
  end
  def greet 
    puts "Ⓦⓗⓔⓔⓛⓑⓐⓢⓔ"
  end
  def add_name
    prompt.ask('Plese tell us your name.', default: ENV['USER'])
  end
  def
    prompt.select("Choose your vehicle.", %w([
      "Ford",
      "BMW",
      "Buick" ]))    
  end
end

# all_cars.map cars do  # all_cars is a method that returns an array of all car instances in the database
#   self.cars.map do |car|
#     car.name
#     car.make
#     car.model
#   end
# end
# puts [ "This is a #{color} #{make} #{model}" ]

# def all_cars_details # method that returns an array of strings
#   self.cars.map do |car|
#     car.name
#     car.make
#     car.model
#   end
# end 
# # each string describing a car in the database. 
# def all_users #returns an array of all user instances in the database
# end
#specific_user is a method that takes in a name (string) as an argument. It should return the first instance of a user

#   def all_artist_names
#     # return an array of strings containing every musician's name
#     self.artists.map do |artist|
#       artist.name
#     end
#   end
# end

# def drake_made_this
#   drake = Artist.find_or_create_by(name: 'Drake')
#   self.artist = drake
# end