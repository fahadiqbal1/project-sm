require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(
      :phone_number => '123456789',
      :password => 'test123'
    )
    assert user.valid?
  end
  test "should not allow empty phone_number" do
    user = User.new( :email => 'test@example.com', :password => 'test123' )
    refute user.valid?, 'user is valid without a phone number'
    assert_not_nil user.errors[:phone_number], 'no validation error for phone number present'
  end
  test "should not allow invalid phone_number" do
    user = User.new( :phone_number => 'abc123fwe', :email => 'test@example.com', :password => 'test123' )
    refute user.valid?, 'user is valid without a valid phone number'
    assert_not_nil user.errors[:phone_number], 'no validation error for phone number present'
  end
  test "should not allow invalid phone_dial_code" do
    user = User.new( :phone_number => 'abc123fwe', :email => 'test@example.com', :password => 'test123', :phone_dial_code => 'abc' )
    refute user.valid?, 'user is valid without a valid phone dial code'
    assert_not_nil user.errors[:phone_dial_code], 'no validation error for phone dial code present'
  end
  test "should not allow invalid email" do
    user = User.new( :phone_number => '5555555555', :email => 'test_example.com', :password => 'test123' )
    refute user.valid?, 'user is valid without a proper email'
    assert_not_nil user.errors[:email], 'no validation error for email present'
  end
  test "should not allow invalid password" do
    user = User.new( :phone_number => '5555555555', :email => 'test_example.com', :password => 'test' )
    refute user.valid?, 'user is valid without a proper password'
    assert_not_nil user.errors[:password], 'no validation error for password present'
  end
end
