class OrderItemsController < ApplicationController

  def create
    chosen_product = Product.find(params[:product_id])
    current_order = @current_order

    # If cart already has this product then find the relevant
    binding.pry
    if current_order.user.include?(chosen_product)
      @order_item = current_order.order_items.find_by(:product_id => chosen_product)
      @order_item.quantity += 1
    else
      @order_item = OrderItem.new
      @order_item.order = current_order
      @order_item.product = chosen_product
    end

    @order_item.save
    redirect_to orders_path(current_order)
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to orders_path(@current_order)
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :cart_id)
    end
end
