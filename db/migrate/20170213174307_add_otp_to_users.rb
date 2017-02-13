class AddOtpToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :otp, :string
    add_column :users, :otp_timestamp, :timestamp
    
    add_index :users, :otp, unique: true
  end
end
