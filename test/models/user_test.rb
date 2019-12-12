require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save invalid user" do
    user = User.new
    user.save
    refute user.valid?
  end

  test "should save valid user" do
    user = User.new
    user.username = "testusername"
    user.email = "bob@example.com"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.save
    assert user.valid?
  end

  test "should not save duplicate user email" do
    user1 = User.new
    user1.username = "testusername"
    user1.email = "dan@example.com"
    user1.password = "123456"
    user1.password_confirmation = "123456"
    user1.save
    assert user1.valid?

    user2 = User.new
    user2.username = "testusername"
    user2.email = "dan@example.com"
    user2.password = "123456"
    user2.password_confirmation = "123456"
    user2.save
    refute user2.valid?
  end
end
