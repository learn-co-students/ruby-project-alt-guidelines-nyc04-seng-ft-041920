class User < ActiveRecord::Base
    has_many :orders
    has_many :couriers, through: :orders


    def self.find_email_address(email_address)
        User.find_by(emailaddress: email_address)
    end

    def self.find_password(password)
        User.exists?(password: password)
    end


end