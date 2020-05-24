class CreatePlantLists < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_lists do |t| #we get a block variable here for the table
      #primary key of :id is created for us!
      # defining columns is as simple as t.[datatype] :column
      t.string :species
      t.string :moisture_use
      t.integer :watering_cycle
    end
  end
end
