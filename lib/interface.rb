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