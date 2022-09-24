class Store < ApplicationRecord
    has_many :store_transactions
    has_many :csv_transaction_details
end
