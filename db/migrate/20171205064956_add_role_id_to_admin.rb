class AddRoleIdToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :role_id, :integer
  end
end
