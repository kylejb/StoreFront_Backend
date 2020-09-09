class Payment < ApplicationRecord
    

    def self.aggregate_order_from_cart(cart_arr, user_obj)
        cart_arr.each { | cart_item | PurchaseHistory.create(user: user_obj, item_id: cart_item.id, status: "pending") }
    end

    def self.build_payment_object(current_order)
        return { amount: current_order.cost, currency: 'usd', source: 'tok_visa', description: item_description } 
    end
end