require 'stripe'

module StripeApi
    BASE_URL = 'https://api.stripe.com'
    Stripe.api_key = Rails.application.credentials.stripe_test_api[:secret]

    def self.test_charge(amount, item_description)
        Stripe::Charge.create({
            amount: amount,
            currency: 'usd',
            source: 'tok_visa',
            description: item_description,
        })
    end
end