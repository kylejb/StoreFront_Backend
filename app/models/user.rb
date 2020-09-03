class User < ApplicationRecord
    has_many :purchase_histories

    has_secure_password
    validates :email, uniqueness: true 
end
