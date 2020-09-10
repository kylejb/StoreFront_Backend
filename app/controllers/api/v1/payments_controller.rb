class Api::V1::PaymentsController < ApplicationController
    # remove 'skip_before_action' after testing frontend's POST request to place order
    skip_before_action :authorized, only: [:create]

    def create
        # TODO - make sure Auth grabs user from token in client-side request; either through controller logic or decoding the request token
        Payment.aggregate_order_from_cart(params[:payment][:order][0][:cart], current_user)

        # build payment object for Stripe API through 'payment' model
        #? confirm datatype of total when testing... likely an array of float (if value within array is string, convert to float)
        total_payment = params[:payment][:order][0][:total][0]
        user_payment_object = build_payment_object(total_payment)
        # send request to Stripe API through 'stripe_api' model
        # https://stripe.com/docs/api/charges/object
        stripe_response = StripeApi::test_charge(user_payment_object)

        render json: { payment_confirmation: stripe_response["receipt_url"] }, status: :created
    end


    private

    def payment_params
        params.require(:payment).permit(order: [total: [], cart: [:id], billing: [:addressLine1, :addressLine2, :city, :state, :zipcode], shipping: [:addressLine1, :addressLine2, :city, :state, :zipcode]])
    end

end
