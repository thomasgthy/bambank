require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "should not save user without email, password and password_confirmation" do
	  user = User.new
	  assert_not user.save
	end
	
	test "hould save user with email, password and password_confirmation" do
	  user = User.new(email: "a@gmail.com", password: "1234567", password_confirmation: "1234567")
	  assert user.save
	end
end
