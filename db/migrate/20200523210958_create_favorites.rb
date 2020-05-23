class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.text :ingredients
      t.integer :calories
      t.text :description
      t.integer :user_id
    end
  end
end
