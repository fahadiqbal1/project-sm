# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  phone_number           :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  otp                    :string
#  otp_timestamp          :datetime
#  otp_confirmed_at       :datetime
#  phone_dial_code        :integer          default("1")
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(
      :phone_number => "123456789",
      :phone_dial_code => 1,
      :password => "test123"
    )
    assert user.valid?
  end
  test "should not allow empty phone_number" do
    user = User.new(:email => "test@example.com", :password => "test123")
    refute user.valid?, "user is valid without a phone number"
    assert_not_nil user.errors[:phone_number],
                   "no validation error for phone number present"
  end
  test "should not allow invalid phone_number" do
    user = User.new(
      :phone_number => "abc123fwe",
      :email => "test@example.com",
      :password => "test123"
    )
    refute user.valid?, "user is valid without a valid phone number"
    assert_not_nil user.errors[:phone_number],
                   "no validation error for phone number present"
  end
  test "should not allow invalid phone_dial_code" do
    user = User.new(
      :phone_number => "1913436758",
      :email => "test@example.com",
      :password => "test123",
      :phone_dial_code => "abc"
    )
    refute user.valid?, "user is valid without a valid phone dial code"
    assert_not_nil user.errors[:phone_dial_code],
                   "no validation error for phone dial code present"
  end
  test "should not allow empty phone dial code" do
    user = User.new(
      :phone_number => "5555555555",
      :email => "test_example.com",
      :password => "test",
      :phone_dial_code => nil
    )
    refute user.valid?, "user is valid without a proper phone dial code"
    assert_not_nil user.errors[:phone_dial_code],
                   "no validation error for phone dial code present"
  end
  test "should not allow invalid email" do
    user = User.new(
      :phone_number => "5555555555",
      :email => "test_example.com",
      :password => "test123"
    )
    refute user.valid?, "user is valid without a proper email"
    assert_not_nil user.errors[:email], "no validation error for email present"
  end
  test "should not allow invalid password" do
    user = User.new(
      :phone_number => "5555555555",
      :email => "test_example.com",
      :password => "test"
    )
    refute user.valid?, "user is valid without a proper password"
    assert_not_nil user.errors[:password],
                   "no validation error for password present"
  end
end
