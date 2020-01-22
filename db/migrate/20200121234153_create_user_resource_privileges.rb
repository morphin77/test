class CreateUserResourcePrivileges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_resource_privileges do |t|
      t.references :user, foreign_key: true
      t.references :resource, foreign_key: true
      t.references :resource_permission, foreign_key: true

      t.timestamps
    end
  end
end
