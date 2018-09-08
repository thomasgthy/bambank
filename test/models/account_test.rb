require 'test_helper'

class AccountTest < ActiveSupport::TestCase
	setup do
		@user=users(:one)
	end
	test "should not save account without user_id and balance" do
	  account = Account.new
	  assert_not account.save
	end
	
	test "should save account with user_id and balance" do
	  account = @user.build_account(balance: 100.0)
	  assert account.save
	end
end
