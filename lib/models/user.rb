class User < ActiveRecord::Base
  has_many :moods
  has_many :recipes, through: :moods

  def self.register
    prompt = TTY::Prompt.new
    name = prompt.ask("What's your name?")
    last_name = prompt.ask("What's your last name?")
    full_name = name + " " + last_name
    username = name[0] + last_name
    custom_username = prompt.ask ("Your default username is #{username}. Would you like to customize it?")
    custom_username.downcase!
    if custom_username == "y" || custom_username == "yes"
      username = prompt.ask("What is your desired username?")
      if User.find_by(username: username)
        puts "sorry! that username has been taken!, try again!"
        # call itself again
      else
        password = prompt.mask("Enter desired password", echo: false)
        User.create(username: username, name: full_name)
        puts "your account has been created! Now, please log in!"
      end
    else
      custom_username == "no" || custom_username == "n"
      User.create(username: username, name: full_name)
      puts "Your account has been created"
    end
  end

  def self.login
    prompt = TTY::Prompt.new
    puts "Welcome back!"
    username = prompt.ask("Please enter your username?")
    found_user = User.all.find_by(username: username)
    if found_user
      puts "Welcome back to Smoodie, #{found_user.name}"
      return found_user
    elsif !found_user
      puts "Sorry! that name does not exist in our database"
    end
  end
end
