class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable
     
	has_one :cart, ->{ paid }, class_name: Cart.name

	has_many :unpaid_items, through: :cart, dependent: :destroy
	has_many :unpaid_products, through: :unpaid_item , source: :product

	has_many :carts
	has_many :cart_items, through: :cart
	has_many :products, through: :cart_item, source: :product
	has_many :paid_products, through: :cart_item, source: :product
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
