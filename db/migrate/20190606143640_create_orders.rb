class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :item_name
      t.integer :party_id
      t.boolean :served
      t.integer :price
      t.integer :recipe_id

      t.timestamps
    end
  end
end
