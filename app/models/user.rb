class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable
	has_one :order, ->{unpaid}, class_name: Order.name
	has_many :unpaid_items, through: :orders, source: :order_item
	has_many :unpaid_products, through: :unpaid_items, source: :product

	has_many :orders
	has_many :order_items, through: :orders
	has_many :products, through: :order_items, source: :product
	has_many :paid_products, through: :order_items, source: :product
	PASSWORD_FORMAT = /\A
		(?=.{8,})          # Must contain 8 or more characters
		(?=.*\d)           # Must contain a digit
		(?=.*[a-z])        # Must contain a lower case character
		(?=.*[A-Z])        # Must contain an upper case character
		(?=.*[[:^alnum:]]) # Must contain a symbol
	/x
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :encrypted_password,
		presence: true,
		length: { in: Devise.password_length },
		format: { with: PASSWORD_FORMAT },
		confirmation: true,
		on: :create
end
