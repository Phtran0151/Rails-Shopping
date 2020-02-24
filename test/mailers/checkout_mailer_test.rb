require 'test_helper'

class CheckoutMailerTest < ActionMailer::TestCase
  test "new checkout email" do
    # Set up an order based on the fixture
    checkout = checkout(:one)

    # Set up an email using the order contents
    email = CheckoutMailer.with(checkout: checkout).new_checkout_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal "You got a new order!", email.subject
    assert_match checkout.name, email.html_part.body.encoded
    assert_match checkout.name, email.text_part.body.encoded
    assert_match checkout.email, email.html_part.body.encoded
    assert_match checkout.email, email.text_part.body.encoded
    assert_match checkout.address, email.html_part.body.encoded
    assert_match checkout.address, email.text_part.body.encoded
    assert_match checkout.phone, email.html_part.body.encoded
    assert_match checkout.phone, email.text_part.body.encoded
    assert_match checkout.message, email.html_part.body.encoded
    assert_match checkout.message, email.text_part.body.encoded
end
