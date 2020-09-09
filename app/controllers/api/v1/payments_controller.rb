class Api::V1::PaymentsController < ApplicationController
    # remove 'skip_before_action' after testing frontend's POST request to place order
    skip_before_action :authorized, only: [:create]

    def create
        # build payment object for Stripe API through 'payment' model
        # send request to Stripe API through 'stripe_api' model

        render json: { payment_confirmation: "Payment Receipt Object Will Be Passed Here (and/or URL object from Stripe API)"}, status: :created
    end
    

    private

    def payment_params
        params.require(:payment).permit(order: [cart: [:id], billing_address: [:addressLine1, :addressLine2, :city, :state, :zipcode], shipping_address: [:addressLine1, :addressLine2, :city, :state, :zipcode]])
    end

end
