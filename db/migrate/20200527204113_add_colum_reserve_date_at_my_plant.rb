class AddColumReserveDateAtMyPlant < ActiveRecord::Migration[5.2]
  def change
    add_column :my_plants, :reserved_date, :datetime
  end
end
