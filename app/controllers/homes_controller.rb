class HomesController < ApplicationController
	# Get the required variable to display the dashboard of the application
	def index
		@transaction_sent = Transaction.where(from_id: current_user.account.id)
    	@transaction_received = Transaction.where(to_id: current_user.account.id)
    	@current_balance=current_user.account.balance
	end
end