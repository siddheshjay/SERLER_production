class ChangeRoleDefaultToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :roles_mask, :integer, default: 0
  end
end