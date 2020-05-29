class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :driver_id
      t.integer :car_id
      t.timestamps
    end
  end
end
