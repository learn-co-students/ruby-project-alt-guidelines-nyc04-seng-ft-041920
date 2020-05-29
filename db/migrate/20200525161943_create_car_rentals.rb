class CreateCarRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :car_rentals do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :horsepower
      t.string :color
    end
  end
end
