class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.string :mood
      t.integer :user_id
      t.integer :recipe_id
    end
  end
end
