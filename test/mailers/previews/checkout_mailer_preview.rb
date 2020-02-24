# Preview all emails at http://localhost:3000/rails/mailers/checkout_mailer
class CheckoutMailerPreview < ActionMailer::Preview
	def new_checkout_email
		checkout = Checkout.new
	    CheckoutMailer.with(checkout: Checkout.first).new_checkout_email.deliver_now
	end
end
