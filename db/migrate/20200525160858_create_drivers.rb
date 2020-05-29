class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :full_name
      t.integer :age
      t.string :user_name
    end
  end
end
