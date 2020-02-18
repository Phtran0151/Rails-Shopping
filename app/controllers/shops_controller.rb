class ShopsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id]) rescue not_found
	end

	private

	def add_quantity
		@order_item = OrderItem.find(params[:id])
		@order_item.quantity += 1
		@order_item.save
		redirect_to orders_path(@current_order)
	end

	def reduce_quantity
	  @order_item = OrderItem.find(params[:id])
	  if @order_item.quantity > 1
	  	@order_item.quantity -= 1
	  end
	  @order_item.save
	  redirect_to orders_path(@current_order)
	end
end
