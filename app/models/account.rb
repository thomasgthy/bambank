class Account < ApplicationRecord
	validates :user_id, presence: true
	validates :balance, presence: true

	belongs_to :user
end
