class AddRolesToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :translator, :boolean, null: false, default: false
    add_column :admins, :approver, :boolean, null: false, default: false
    add_column :admins, :superuser, :boolean, null: false, default: false
    add_column :admins, :admin, :boolean, null: false, default: false
  end
end
