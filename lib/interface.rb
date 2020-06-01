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
  def choose_vehicle_type
    prompt.select("Choose your vehicle.", [
      "Ford",
      "BMW",
      "Buick" ])    
  end
end


Ian = User.new  class 
Ian.name = "Ian"
Ian.age = 25
Bashir = User
an Instance is a component of a class
Ian.license = "ML87234565432q457y"

Ian.license #  +>  "ML87234565432q457y"