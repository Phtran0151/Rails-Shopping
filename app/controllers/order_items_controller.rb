class OrderItemsController < ApplicationController

  def create
    product = Product.find_by_id(params[:product_id])
    if product.blank?
      redirect_to cart_items_path, alert: "Product not found"
    end
    # binding.pry

    @order_item = OrderItem.create(product_id: product.id, order_id: current_order.id)
    # @add_item = OrderItem.find(params[:id])
    # quantity = params[:add_item][:quantity]
    # @add_item.update_attribute(:quantity, quantity)

    if @order_item.save
      redirect_to orders_path(product.id), notice: "Successly add product to cart"
    else
      render :new, alert: "Unsuccessful to add products"
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to orders_path(@current_order)
  end

  private

    def set_quantity
      params.permit(:quantity)
    end
end
