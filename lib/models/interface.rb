require 'colorize'
class Interface
    attr_accessor :prompt, :driver, :car
    
    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome     
      
                                                                                                                                                                           
                                                                                                                                                                           
puts "
                                                                                                                                                                        
                                                                                                                                                                        
FFFFFFFFFFFFFFFFFFFFFF     OOOOOOOOO     RRRRRRRRRRRRRRRRR   EEEEEEEEEEEEEEEEEEEEEEIIIIIIIIII      GGGGGGGGGGGGGNNNNNNNN        NNNNNNNN 222222222222222      1111111   
F::::::::::::::::::::F   OO:::::::::OO   R::::::::::::::::R  E::::::::::::::::::::EI::::::::I   GGG::::::::::::GN:::::::N       N::::::N2:::::::::::::::22   1::::::1   
F::::::::::::::::::::F OO:::::::::::::OO R::::::RRRRRR:::::R E::::::::::::::::::::EI::::::::I GG:::::::::::::::GN::::::::N      N::::::N2::::::222222:::::2 1:::::::1   
FF::::::FFFFFFFFF::::FO:::::::OOO:::::::ORR:::::R     R:::::REE::::::EEEEEEEEE::::EII::::::IIG:::::GGGGGGGG::::GN:::::::::N     N::::::N2222222     2:::::2 111:::::1   
  F:::::F       FFFFFFO::::::O   O::::::O  R::::R     R:::::R  E:::::E       EEEEEE  I::::I G:::::G       GGGGGGN::::::::::N    N::::::N            2:::::2    1::::1   
  F:::::F             O:::::O     O:::::O  R::::R     R:::::R  E:::::E               I::::IG:::::G              N:::::::::::N   N::::::N            2:::::2    1::::1   
  F::::::FFFFFFFFFF   O:::::O     O:::::O  R::::RRRRRR:::::R   E::::::EEEEEEEEEE     I::::IG:::::G              N:::::::N::::N  N::::::N         2222::::2     1::::1   
  F:::::::::::::::F   O:::::O     O:::::O  R:::::::::::::RR    E:::::::::::::::E     I::::IG:::::G    GGGGGGGGGGN::::::N N::::N N::::::N    22222::::::22      1::::l   
  F:::::::::::::::F   O:::::O     O:::::O  R::::RRRRRR:::::R   E:::::::::::::::E     I::::IG:::::G    G::::::::GN::::::N  N::::N:::::::N  22::::::::222        1::::l   
  F::::::FFFFFFFFFF   O:::::O     O:::::O  R::::R     R:::::R  E::::::EEEEEEEEEE     I::::IG:::::G    GGGGG::::GN::::::N   N:::::::::::N 2:::::22222           1::::l   
  F:::::F             O:::::O     O:::::O  R::::R     R:::::R  E:::::E               I::::IG:::::G        G::::GN::::::N    N::::::::::N2:::::2                1::::l   
  F:::::F             O::::::O   O::::::O  R::::R     R:::::R  E:::::E       EEEEEE  I::::I G:::::G       G::::GN::::::N     N:::::::::N2:::::2                1::::l   
FF:::::::FF           O:::::::OOO:::::::ORR:::::R     R:::::REE::::::EEEEEEEE:::::EII::::::IIG:::::GGGGGGGG::::GN::::::N      N::::::::N2:::::2       222222111::::::111
F::::::::FF            OO:::::::::::::OO R::::::R     R:::::RE::::::::::::::::::::EI::::::::I GG:::::::::::::::GN::::::N       N:::::::N2::::::2222222:::::21::::::::::1
F::::::::FF              OO:::::::::OO   R::::::R     R:::::RE::::::::::::::::::::EI::::::::I   GGG::::::GGG:::GN::::::N        N::::::N2::::::::::::::::::21::::::::::1
FFFFFFFFFFF                OOOOOOOOO     RRRRRRRR     RRRRRRREEEEEEEEEEEEEEEEEEEEEEIIIIIIIIII      GGGGGG   GGGGNNNNNNNN         NNNNNNN22222222222222222222111111111111
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
".colorize(:red)
                                                                                                                                                                           
                                                                                                                                                                           
                                                                                                                                                                           
                                                                                                                                                                           
                                                                                                                                                                           
                                                                                                                                                                           
                                                                                                                                                                           
  
      puts "                                    Welcome to Foreign21 🏎, the only place where you can rent your dream car... FOR FREE!".colorize(:blue)
    end

    def new_or_existing_driver
      result = prompt.select("Are you a new or existing driver?".colorize(:red), ["Existing Driver", "New Driver"])
      if result == "New Driver"    
        puts "Hey there! Before we can continue, let's get you set up!"
        Driver.create_account
      elsif result == "Existing Driver"
        Driver.existing_acct
      end

    end
    
    def new_car
      result = CarRental.select_car
      self.car = result
    end

    

  
    def main_menu
      puts "Hello #{driver.full_name.split[0]}"
        sleep(1)
      result = prompt.select("What would you like to do today?", ["View exotic cars", "Create a new booking", "View existing booking", "Change booking", "Cancel a booking"])
      if result == "View exotic cars"
        CarRental.view_car
      elsif result == "Create a new booking"
        new_car
        new_booking = Booking.create(driver_id: self.driver.id, car_id: self.car.id) 
        puts "Your booking is created!" 
      elsif result == "View existing booking"
        Booking.where(driver_id: self.driver.id).find_each do |booking|
          if booking.car_id == 1
            puts "You have a booking with the Yellow 2020 Lamborghini Aventador SVJ"
          elsif booking.car_id == 2
              puts "You have a booking with the Orange 2018 Mclaren 720S"
          elsif booking.car_id == 3
              puts "You have a booking with the Purple 2019 Porsche GT3"
          elsif booking.car_id == 4
              puts "You have a booking with the Red 2015 Ferrari Laferrari"
          elsif booking.car_id == 5
              puts "You have a booking with the Blue 2020 Bugatti Chiron"
          elsif booking.car_id == 6
              puts "You have a booking with the Green 2017 Mercedes AMG GT"
          elsif booking.car_id == 7
              puts "You have a booking with the Grey 2018 Ferrari 812 Superfast"
          elsif booking.car_id == 8
              puts "You have a booking with the Black 2020 Mercedes G63 AMG"
          elsif booking.car_id == 9
              puts "You have a booking with the Black 2015 Rolls-Royce Wraith"
          elsif booking.car_id == 10
              puts "You have a booking with the Silver 1965 Aston Martin DB5"
          else
            puts "You have no bookings at the moment"
          end
        end
      elsif result == "Change booking"
        choice = prompt.select('What car do you want to update to?') do |car|
          car.choice 'Yellow 2020 Lamborghini Aventador SVJ', CarRental.find_by(model: "Aventador SVJ")
          car.choice 'Orange 2018 Mclaren 720S', CarRental.find_by(model: "720S")
          car.choice 'Purple 2019 Porsche GT3', CarRental.find_by(model: "GT3")
          car.choice 'Red 2015 Ferrari Laferrari', CarRental.find_by(model: "Laferrari")
          car.choice 'Blue 2020 Bugatti Chiron', CarRental.find_by(model: "Chiron")
          car.choice 'Green 2017 Mercedes AMG GT', CarRental.find_by(model: "AMG GT")
          car.choice 'Grey 2018 Ferrari 812 Superfast', CarRental.find_by(model: "812 Superfast")
          car.choice 'Black 2020 Mercedes G63 AMG', CarRental.find_by(model: "G63 AMG")
          car.choice 'Black 2015 Rolls-Royce Wraith', CarRental.find_by(model: "Wraith")
          car.choice 'Silver 1965 Aston Martin DB5', CarRental.find_by(model: "DB5")
        end

        Booking.where(driver_id: self.driver.id).find_each do |booking|
          booking.update(car_id: choice.id)
          puts "Your booking is updated!"
        end
      else result == "Cancel a booking"
        Booking.where(driver_id: self.driver.id).find_each do |booking|
          booking.destroy
          puts "You no longer have any bookings!"
        end
      end
    end
        
    def goodbye 
      puts "
                                                                                                                                                  
                                                                                                                                                  
      GGGGGGGGGGGGG     OOOOOOOOO          OOOOOOOOO     DDDDDDDDDDDDD      BBBBBBBBBBBBBBBBB   YYYYYYY       YYYYYYYEEEEEEEEEEEEEEEEEEEEEE !!! 
   GGG::::::::::::G   OO:::::::::OO      OO:::::::::OO   D::::::::::::DDD   B::::::::::::::::B  Y:::::Y       Y:::::YE::::::::::::::::::::E!!:!!
 GG:::::::::::::::G OO:::::::::::::OO  OO:::::::::::::OO D:::::::::::::::DD B::::::BBBBBB:::::B Y:::::Y       Y:::::YE::::::::::::::::::::E!:::!
G:::::GGGGGGGG::::GO:::::::OOO:::::::OO:::::::OOO:::::::ODDD:::::DDDDD:::::DBB:::::B     B:::::BY::::::Y     Y::::::YEE::::::EEEEEEEEE::::E!:::!
G:::::G       GGGGGGO::::::O   O::::::OO::::::O   O::::::O  D:::::D    D:::::D B::::B     B:::::BYYY:::::Y   Y:::::YYY  E:::::E       EEEEEE!:::!
G:::::G              O:::::O     O:::::OO:::::O     O:::::O  D:::::D     D:::::DB::::B     B:::::B   Y:::::Y Y:::::Y     E:::::E             !:::!
G:::::G              O:::::O     O:::::OO:::::O     O:::::O  D:::::D     D:::::DB::::BBBBBB:::::B     Y:::::Y:::::Y      E::::::EEEEEEEEEE   !:::!
G:::::G    GGGGGGGGGGO:::::O     O:::::OO:::::O     O:::::O  D:::::D     D:::::DB:::::::::::::BB       Y:::::::::Y       E:::::::::::::::E   !:::!
G:::::G    G::::::::GO:::::O     O:::::OO:::::O     O:::::O  D:::::D     D:::::DB::::BBBBBB:::::B       Y:::::::Y        E:::::::::::::::E   !:::!
G:::::G    GGGGG::::GO:::::O     O:::::OO:::::O     O:::::O  D:::::D     D:::::DB::::B     B:::::B       Y:::::Y         E::::::EEEEEEEEEE   !:::!
G:::::G        G::::GO:::::O     O:::::OO:::::O     O:::::O  D:::::D     D:::::DB::::B     B:::::B       Y:::::Y         E:::::E             !!:!!
G:::::G       G::::GO::::::O   O::::::OO::::::O   O::::::O  D:::::D    D:::::D B::::B     B:::::B       Y:::::Y         E:::::E       EEEEEE !!! 
G:::::GGGGGGGG::::GO:::::::OOO:::::::OO:::::::OOO:::::::ODDD:::::DDDDD:::::DBB:::::BBBBBB::::::B       Y:::::Y       EE::::::EEEEEEEE:::::E     
 GG:::::::::::::::G OO:::::::::::::OO  OO:::::::::::::OO D:::::::::::::::DD B:::::::::::::::::B     YYYY:::::YYYY    E::::::::::::::::::::E !!! 
   GGG::::::GGG:::G   OO:::::::::OO      OO:::::::::OO   D::::::::::::DDD   B::::::::::::::::B      Y:::::::::::Y    E::::::::::::::::::::E!!:!!
      GGGGGG   GGGG     OOOOOOOOO          OOOOOOOOO     DDDDDDDDDDDDD      BBBBBBBBBBBBBBBBB       YYYYYYYYYYYYY    EEEEEEEEEEEEEEEEEEEEEE !!! 
                                                                                                                                                
                                                                                                                                                
                                                                                                                                                
                                                                                                                                                
                                                                                                                                                
                                                                                                                                                
                                                                                                                                                
".colorize(:blue)
puts "                                                    Come back you soon, your dream car is waiting!".colorize(:red)
    end

  end  



