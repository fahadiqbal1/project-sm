class AddCountryCodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_dial_code, :integer, :default => 1
  end
end
