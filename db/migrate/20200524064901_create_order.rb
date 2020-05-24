class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :unit_id
      t.float :amount
    end
  end
end
