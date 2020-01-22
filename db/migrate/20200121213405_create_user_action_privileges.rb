class CreateUserActionPrivileges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_action_privileges do |t|
      t.references :user
      t.references :action
      t.references :action_permission

      t.timestamps
    end
  end
end
