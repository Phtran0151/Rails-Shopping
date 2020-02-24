class CheckoutController < ApplicationController
	def index
		@checkout = Checkout.new
	end

	def create
		@checkout = Checkout.new(checkout_params)
		if @checkout.save
	      	CheckoutMailer.with(checkout: @checkout).new_checkout_email.deliver_later
	      	url = 'http://localhost:3000/rails/mailers/checkout_mailer/new_checkout_email.txt?locale=en'
			redirect_to url, notice: 'Payment method was successfully created.'
		else
			render index
		end
	end

	private

	def checkout_params
    	params.require(:checkout).permit(:name, :address, :phone, :message, :email)
	end
end
