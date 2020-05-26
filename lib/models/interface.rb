class Interface
  attr_accessor :prompt, :user

  def initialize
    @prompt = TTY::Prompt.new
  end

  def welcome
    puts "Welcome to Smoodie!"
    sleep 2
    puts "........."
    sleep 1
    puts "Before giving you our secret smoothie recipes, we need you to login."
    log_in()
  end

  def chooose_login_or_register
    log_in_answer = prompt.select("Choose an option?", %w(Login Register))
    if log_in_answer == "Login"
      User.login
    elsif log_in_answer == "Register"
      User.Register
    end
  end

  def main_menu
    puts "Hello, welcome to the app,! #{user.username}"
  end

  #
  # def clear
  # system "clear"
  # end
end

# main menu method
# greet user
# prompt for mood
# get list of moods from moods and display
#
#
# figuring out the seeing
#
# loading method
# puts some loading dots as placerholder
# ...
#
# association method
# it should retrieve the recipe that belongs to that mood
# and siplay all recipe information

# we should have the logout option

# finish the seed assoations
