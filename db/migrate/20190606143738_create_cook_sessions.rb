class CreateCookSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_sessions do |t|
      t.integer :recipe_id
      t.integer :order_id
      t.integer :pot_id

      t.timestamps
    end
  end
end
