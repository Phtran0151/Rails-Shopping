class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	scope :unpaid, ->{where completed_at: false }
	scope :paid,   ->{where completed_at: true }

	private

	def add_product(product_id)
		current_item = order_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = order_items.build(:product_id => product_id)
		end
	end
end
