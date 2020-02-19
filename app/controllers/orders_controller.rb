class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_filter :current_order, only: [:show]

  def show
    @orders = Order.all
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = @current_order
    @order.destroy
    session[:order_id] = nil
    redirect_to root_path
  end

  private

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :completed_at)
    end
end
