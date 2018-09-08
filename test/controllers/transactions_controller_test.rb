require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  #test "should get new" do
  #  get new_transaction_path
  #  assert_response :success
  #end

  #test "should create transaction" do
  #  assert_difference('Transaction.count') do
  #    post transactions_path, params: { transaction: {  } }
  #  end

  #  assert_redirected_to transaction_path(Transaction.last)
  #end

end
