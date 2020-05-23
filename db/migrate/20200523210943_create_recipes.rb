class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name_of_recipe
      t.string :ingredients
      t.text :description
      t.integer :calories
    end
  end
end
