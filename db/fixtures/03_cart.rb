# product_ids = Product.ids

# 5.times do |n|
# 	User.all.each do |user|
#     	ActiveRecord::Base.transaction do
#     		u_cart = user.orders.create! completed_at: Faker::Boolean.boolean
#     		binding.pry
#     		u_cart.order_items.create! product_id: product_ids.sample, quantity: Faker::Number.between(from: 1, to: 5)
#     	end
#   	end
# end