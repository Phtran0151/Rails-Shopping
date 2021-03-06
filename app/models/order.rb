class Order < ApplicationRecord
	belongs_to :user
	has_many :unpaid_items, :through => :orders, :source => :order_item

	# LOGIC
	def sub_total
		sum = 0
		self.order_items.each do |item|
			sum += item.total_price
		end
		return sum
	end
end
