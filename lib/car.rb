class Car < ActiveRecord::Base
has_many :agreements
has_many :users, through: :agreements

# def all_cars # returns an array of all car instances in the database
#     self.map
    
# end

# def all_cars_details # is a method that returns an array of strings, each string describing a car in the database. Example would be something like
# end

end