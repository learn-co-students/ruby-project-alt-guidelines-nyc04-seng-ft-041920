require "tty-prompt"
prompt = TTY::Prompt.new

def greeting
  puts "Welcome to Smoodie!"
  sleep 2
  puts "........."
  sleep 1
  puts "Before giving you our secret smoothie recipes, we need you to login."
  log_in()
end

def clear
  system "clear"
end

def register
  prompt = TTY::Prompt.new
  name = prompt.ask("What's your name?")
  last_name = prompt.ask("What's your last name?")
  full_name = name + " " + last_name
  username = name[0] + last_name
  default_username = prompt.ask ("Your default username is #{username}. Would you like to customize it?")
  if default_username == "Y" || default_username == "Yes" || default_username == "yes"
    username = prompt.ask("What is your desired username?")
    # prompt.mask('What is your passpor?', echo: false)
    User.create(username: username, name: full_name)
    clear()
    sleep 2
    puts "your account has been created!"
  elsif default_username == "no" || default_username == "n"
    User.create(username: username, name: full_name)
    sleep3
    puts "Your account has been created"
  end
end

def log_in
  prompt = TTY::Prompt.new
  log_in = prompt.select("Choose an option?", %w(Login Register))
  #   binding.pry
  if log_in == "Login"
    find_user()
  elsif log_in == "Register"
    puts "Let's get you settled with an account"
    register()
  end
end

def find_user()
  prompt = TTY::Prompt.new
  puts "Welcome back!"
  username = prompt.ask("Please enter your username?")
  user = User.all.find_by(username: username)
  puts "Welcome back to Smoodie, #{user.name}"
end
