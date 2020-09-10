module Payment
    

    def self.aggregate_order_from_cart(cart_arr, user_obj)
        cart_arr.each { | cart_item | PurchaseHistory.create(user: user_obj, item_id: cart_item.id, status: "pending") }
    end

    def self.build_payment_object(current_order_total)
        { 
            amount: current_order_total, 
            currency: 'usd', 
            source: 'tok_visa', 
            description: "Testing Stripe API with 'Demo Credit Card'", 
        }
    end
end