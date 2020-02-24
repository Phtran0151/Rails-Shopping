class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(checkout)
  	@checkout = checkout
  	CheckoutMailer.new_checkout_email(@checkout).deliver_later
  end
end
