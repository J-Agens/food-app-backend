class AddCompletedToCookSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :cook_sessions, :completed, :boolean
  end
end
