class Store < ApplicationRecord

    has_many :store_transactions
    has_many :csv_transaction_details

    validates :pos, numericality: { only_integer: true }
    
end
