class AddChefIdToCookSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :cook_sessions, :chef_id, :integer
  end
end
