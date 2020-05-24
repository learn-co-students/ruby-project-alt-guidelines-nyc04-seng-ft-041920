class CreateMyPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :my_plants do |t| #we get a block variable here for the table
      #primary key of :id is created for us!
      # defining columns is as simple as t.[datatype] :column
      t.string :nickname
      t.boolean :watered
      t.datetime :watering_date
      t.integer :plant_list_id
      t.integer :user_id
    end
  end
end
