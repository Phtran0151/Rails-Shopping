class OrderItemsController < ApplicationController

  def create
      current_order = @current_order
      binding.pry
      @order_item = OrderItem.new(order_item_params)
      if @order_item.save
        redirect_to orders_path(current_order), notice: "Thank you."
      else
        redirect_to orders_path(current_order), alert: 'Unable to add comment'
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
    def order_item_params
      params.require(:order_items).permit(:product_id, :cart_id, :quantity)
    end
end
