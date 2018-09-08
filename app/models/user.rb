class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #Had one-to-one association with account
    has_one :account
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
