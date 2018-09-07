class Transaction < ApplicationRecord
	belongs_to :from, :class_name => 'Account', :foreign_key => :from_id
  	belongs_to :to, :class_name => 'Account', :foreign_key => :to_id

  	validates :from_id, presence: true
  	validates :to_id, presence: true
  	validates :amount, presence: true
end
