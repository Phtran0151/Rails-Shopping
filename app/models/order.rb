class Order < ApplicationRecord
	belongs_to :user
	# LOGIC
	def sub_total
		sum = 0
		self.order_items.each do |item|
			sum += item.total_price
		end
		return sum
	end

	def order_product(product)
      current_order = order_items.find_by(product_id: product.id)
      if current_order
        current_order.increment(:quantity)
      else
        current_order = order_items.build(product_id: product.id)
      end
      current_order
    end
end
