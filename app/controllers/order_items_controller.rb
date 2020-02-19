class OrderItemsController < ApplicationController
  before_action :set_quantity

  def create
    @order = current_order
    product = Product.find(params[:product_id])
    if product.blank?
      redirect_to cart_items_path, alert: "Product not found"
    end
    @order_item = OrderItem.create(product_id: product.id, order_id: current_order.id)
    if @order_item.save
      redirect_to orders_path(current_order.id), notice: "Successly add product to cart"
    else
      render :new, alert: "Unsuccessful to add products"
    end
  end

  # DELETE /order_items/products/1
  def destroy
    begin
      current_user.order.order_items.find_by!(id: params[:id]).destroy
    rescue
      redirect_to orders_path, alert: 'Not Found'
    end
  end

  private
    def set_quantity
      params.permit(:quantity)
    end
end
