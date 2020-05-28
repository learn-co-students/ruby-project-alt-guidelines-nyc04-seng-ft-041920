class AddColumCreatedAtMyPlant < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :my_plants, null: true
    today = Date.today
  MyPlant.update_all(created_at: today, updated_at: today)

  change_column_null :my_plants, :created_at, false
  change_column_null :my_plants, :updated_at, false
  end
end
