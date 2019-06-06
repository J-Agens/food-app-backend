class CreatePots < ActiveRecord::Migration[5.2]
  def change
    create_table :pots do |t|

      t.timestamps
    end
  end
end
