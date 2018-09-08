module TransactionsHelper
 #This method will be responsible of creating the transaction
  def performTransaction(transaction)
    #Put the content into a transaction so it keeps the data consistent
    ActiveRecord::Base.transaction do
        from_account=Account.find(transaction.from_id)
        to_account=Account.find(transaction.to_id)

        #Transit money from sender to receiver
        from_account.balance=from_account.balance-transaction.amount
        from_account.save
        to_account.balance=to_account.balance+transaction.amount
        to_account.save
    end
  end
end
