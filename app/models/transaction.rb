class Transaction < ApplicationRecord
	#Link Transaction to Account model
	belongs_to :from, :class_name => 'Account', :foreign_key => :from_id
  	belongs_to :to, :class_name => 'Account', :foreign_key => :to_id

	#Had attribute validators
  	validates :from_id, presence: true, allow_nil: false
  	validates :to_id, presence: true, allow_nil: false
  	validate :valid_amount

  	def valid_amount
  		if not amount.is_a? Float
      		errors.add(:amount, "must be a float")
    	elsif amount<=0
    		errors.add(:amount, "must be positive")
    	elsif from.balance<amount
          	errors.add(:amount, "is too high for your current balance.")
    	end
  	end
end
