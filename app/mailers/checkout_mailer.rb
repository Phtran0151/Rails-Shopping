class CheckoutMailer < ApplicationMailer
	default from: "phuong.tran@tomosia@gmail.com"

	def new_checkout_email
		@checkout = params[:checkout]
		@url = 'gmail.com'
		mail(to: @checkout.email, subject: 'You got a new checkout')
	end
end
