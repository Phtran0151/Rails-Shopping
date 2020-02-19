class PaymentController < ApplicationController
	def index
		@payment = Payment.all
	end

	def show
		@payment = Payment.find([params[:id]])
	end

	def new
		@payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)
		@current_order.order_items.each do |item|
			@order.order_items << item
			item.order_id = nil
		end
		@payment.save
		Order.destroy(session[:cart_id])
		session[:order_id] = nil
		redirect_to root_path
	end

	private
		def payment_params
	    	params.require(:payment).permit(:name, :email, :address, :pay_method)
		end
end