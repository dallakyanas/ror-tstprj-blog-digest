class CreateRoleRights < ActiveRecord::Migration[5.2]
  def change
    create_table :role_rights do |t|
      t.references :role, foreign_key: true
      t.references :action, foreign_key: true

      t.timestamps
    end
    add_index :role_rights, [:role_id, :action_id], :unique => true
  end
end
