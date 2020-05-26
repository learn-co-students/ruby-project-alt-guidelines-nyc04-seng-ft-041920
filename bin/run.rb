require_relative "../config/environment"
interface = Interface.new()
interface.welcome

user_instance = interface.chooose_login_or_register

interface.user = user_instance

interface.main_menu

puts "hello world"
