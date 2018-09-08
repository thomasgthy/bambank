require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
	setup do
		@user1=users(:one)
		@user2=users(:two)
		@account1=@user1.create_account!(balance: 10.0)
		@account2=@user2.create_account!(balance: 10.0)
	end
	test "should not save transaction without from_id, to_id and amount" do
	  transaction = Transaction.new
	  assert_not transaction.save
	end
	
	test "should save transaction with from_id, to_id and amount" do
	  transaction = Transaction.new(from: @account1, to: @account2, amount: 10.0)
	  assert transaction.save
	end
end
