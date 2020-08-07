class CreateCouriers < ActiveRecord::Migration[5.2]
    def change
      create_table :couriers do |t|
        t.string :name
        t.integer :phonenumber
        
  
        t.timestamps
      end
    end
  end