class AddCanceledToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :canceled, :boolean, default: false
  end
end
