class DailyReport < ApplicationRecord
    belongs_to :store_transaction
    # belongs_to :store
    # store_transaction.select('name','card_type') where (store)
end
