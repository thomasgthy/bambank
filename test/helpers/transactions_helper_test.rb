require 'test_helper'
require 'transactions_helper'

class TransactionsHelperTest < ActionDispatch::IntegrationTest
	include TransactionsHelper

	setup do
		@user1=users(:one)
		@user2=users(:two)
		@account1=@user1.create_account!(balance: 50.0)
		@account2=@user2.create_account!(balance: 50.0)
	end
		
	#Teest well-formed transaction
	test "should perform a well-formed transaction" do
		transaction_count=Transaction.count
		transaction=Transaction.create!(from: @account1, to: @account2, amount: 10.0)
		performTransaction(transaction)
		assert_equal(40.0, Account.first.balance)
		assert_equal(60.0, Account.second.balance)
		assert_equal(transaction_count+1, Transaction.count)
	end

	#Test not well-formed transactions
	test "should not perform a transaction with nil from or to" do
		assert_raises("ActiveRecord::Invalid"){
			Transaction.create!(from_id: 123, to_id: 234, amount: 10.0)
		}
		assert_raises("ActiveRecord::Invalid"){
			Transaction.create!(from_id: nil, to_id: nil, amount: 10.0)
		}
		assert_raises("ActiveRecord::Invalid"){
			Transaction.create!(from_id: nil, to_id: nil, amount: 10.0)
		}
		assert_raises("ActiveRecord::Invalid"){
			Transaction.create!(from: @account1, to: @account2, amount: 100.0)
		}
		assert_raises("ActiveRecord::Invalid"){
			Transaction.create!(from: "(§!§èç", to: "'è(§ç§è!ç", amount: 10.0)
		}
	end
end