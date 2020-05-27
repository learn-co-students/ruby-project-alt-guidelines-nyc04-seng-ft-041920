class CreateMoodRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :mood_recipes do |t|
      t.integer :mood_id
      t.integer :recipe_id
    end
  end
end
