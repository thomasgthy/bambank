class Account < ApplicationRecord
	#Had attribute validators
	validates :balance, presence: true

	belongs_to :user
end
