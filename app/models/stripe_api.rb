require 'stripe'

module StripeApi
    BASE_URL = 'https://api.stripe.com'
    Stripe.api_key = Rails.application.credentials.stripe_test_api[:secret]

    def self.test_charge
        Stripe::Charge.create({
            amount: 2000,
            currency: 'usd',
            source: 'tok_visa',
            description: 'My First Test Charge (created from API docs)',
        })
    end
end