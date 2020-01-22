class CreateActionPermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :action_permissions do |t|
      t.string :name
      t.references :action, foreign_key: true

      t.timestamps
    end
  end
end
