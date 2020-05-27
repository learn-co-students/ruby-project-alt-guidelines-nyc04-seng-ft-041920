class AddColumInMyPlant < ActiveRecord::Migration[5.2]
  def change
    add_column :my_plants, :water_cycle, :integer
  end
end
