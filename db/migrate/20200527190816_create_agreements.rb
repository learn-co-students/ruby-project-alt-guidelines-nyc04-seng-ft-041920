class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.integer :user_id
      t.integer :car_id
    end
  end
end
