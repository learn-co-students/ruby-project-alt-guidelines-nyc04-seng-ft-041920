class Interface
  attr_accessor :prompt, :user

  def initialize
    @prompt = TTY::Prompt.new
  end

  def greeting
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
      User.Register()
    end
  end

  def main_menu
    puts "Hello, welcome to the app,! #{username}"
  end

  #
  # def clear
  # system "clear"
  # end
end
