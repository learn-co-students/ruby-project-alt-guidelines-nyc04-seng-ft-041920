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
  end

  def chooose_login_or_register
    log_in_answer = prompt.select("Choose an option?", %w(Login Register))
    if log_in_answer == "Login"
      User.login
    elsif log_in_answer == "Register"
      User.register
    end
  end

  def main_menu
    puts "Hello, welcome to the app,! #{user.username}"
    # puts "You have #{"
  end

  # def clear
  # system "clear"
  # end

  def display
    mood_list = Mood.all.map { |mood| mood.mood }
    user_mood = prompt.select("Please choose your mood, and we'll recommend a smoothie?", (mood_list))
    # binding.pry
    user_mood = Mood.find_by(mood: user_mood)

    Mood.map_recipe(user_mood)
    # user_mood.recipe
  end
end

# main menu method
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
