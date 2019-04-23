#require 'test_helper'
#require "test/unit"
require File.join(File.expand_path(File.dirname(__FILE__)), '../test_helper.rb') 
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "inclusion exclusion msg" do
    u = User.new
    u.name = "admin"
    u.email = "abc@example.com"
    u.valid?
    msgs = u.errors.full_messages
    msg0 = "Name is not included in the list you should choose from [m, f]"
    msg1 = "Name is reserved you should not choose from [admin, administrator]"
    assert_equal msg0, msgs[0]
    assert_equal msg1, msgs[1]
  end
  test "confirmation msg" do
    u = User.new
    u.name = "m"
    u.email_confirmation = ""
    u.valid?
    msgs = u.errors.full_messages
    msg0 = "Email confirmation doesn't match Email, Email is case sensitive"
  end
  test "uniqueness msg" do
    u = User.find_or_create_by(name: "m", email: "test@gmail.com")
    assert_equal true, u.valid?
    u1 = User.create(name: "m", email: "test2@gmail.com")
    assert_equal false, u1.valid?
    msgs = u1.errors.full_messages
    msg0 = "Name has already been taken, Name is case sensitive"
    assert_equal msg0, msgs[0]
  end
  
  test "uniqueness2 msg" do
    u = User.find_or_create_by(name: "m", email: "test@gmail.com")
    u2 = User.create(name: "f", email: "test@gmail.com")
    assert_equal false, u2.valid?
    msgs = u2.errors.full_messages
    msg0 = "Email has already been taken, Email isn't case sensitive"
    assert_equal msg0, msgs[0]
  end
end
