class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :controller_name
      t.string :action_name

      t.timestamps
    end
    add_index :actions, [:controller_name, :action_name], :unique => true
  end
end
