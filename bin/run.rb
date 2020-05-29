require_relative '../config/environment'

new = Interface.new
new.welcome

user_instance = new.new_or_existing_driver
new.driver = user_instance

new.main_menu


sleep(5)
new.goodbye