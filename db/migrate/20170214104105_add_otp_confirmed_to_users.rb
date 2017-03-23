class AddOtpConfirmedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :otp_confirmed_at, :datetime
  end
end
