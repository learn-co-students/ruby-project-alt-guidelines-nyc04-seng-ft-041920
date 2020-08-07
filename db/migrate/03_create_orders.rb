class CreateOrders < ActiveRecord::Migration[5.2]
    def change
      create_table :orders do |t|
        t.string :order
        t.integer :user_id
        t.integer :courier_id

  
        t.timestamps
      end
    end
  end