class AddIsActiveToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :is_active, :boolean, null: false, default: true
  end
end
