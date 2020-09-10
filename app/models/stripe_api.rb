require 'stripe'

module StripeApi
    BASE_URL = 'https://api.stripe.com'
    Stripe.api_key = Rails.application.credentials.stripe_test_api[:secret]

    def self.test_charge(payment_obj)
        Stripe::Charge.create(payment_obj)
    end
end