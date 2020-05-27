class CreateUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :users do |t|
        t.string :emailaddress
        t.string :password
        t.string :name
        t.integer :phonenumber
        t.string :address
  
        t.timestamps
      end
    end
  end