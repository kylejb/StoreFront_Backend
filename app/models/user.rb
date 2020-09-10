class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false } 
    
    belongs_to :address
    has_many :purchase_histories
    has_many :items, through: :purchase_histories
end
