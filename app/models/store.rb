class Store < ApplicationRecord

    has_many :store_transactions, dependent: :destroy
    # has_many :daily_reports
    scope :sorted,lambda { order (" id ASC")}
    require "csv"
    CSV_HEADER = %w{store_id store_name tid card_type name txn_id card_colour amount date}
    def self.to_csv(options = {})
        CSV.generate do |csv|
            csv << CSV_HEADER
            all.each do |store|
                csv << [store.store_id, store.store_name, store.tid,
                store.store_transactions.pluck(:name).join(', '), store.store_transactions.pluck(:txn_id).join(', '),
                store.store_transactions.pluck(:card_type).join(', '),store.store_transactions.pluck(:card_colour).join(', '),
                store.store_transactions.pluck(:amount).join(', '),store.store_transactions.pluck(:date).join(', ')]
            end
        end
    end

    
end
