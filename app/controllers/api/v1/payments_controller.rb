class Api::V1::PaymentsController < ApplicationController
    # remove 'skip_before_action' after testing frontend's POST request to place order
    skip_before_action :authorized, only: [:create]

    def create
        # TODO - make sure Auth grabs user from token in client-side request; either through controller logic or decoding the request token
        Payment.aggregate_order_from_cart(params[:payment][:order][0][:cart], current_user)

        # build payment object for Stripe API through 'payment' model
        # send request to Stripe API through 'stripe_api' model
        # https://stripe.com/docs/api/charges/object

        #* build_payment_object(order)
        #* StripeApi::send_payment(line_15)

        render json: { payment_confirmation: "Payment Receipt Object Will Be Passed Here (and/or URL object from Stripe API)" }, status: :created
    end


    private

    def payment_params
        params.require(:payment).permit(order: [cart: [:id], billing: [:addressLine1, :addressLine2, :city, :state, :zipcode], shipping: [:addressLine1, :addressLine2, :city, :state, :zipcode]])
    end

end
