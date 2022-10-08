class Store < ApplicationRecord

    has_many :store_transactions , dependent: :destroy 

    require "csv"

    def self.to_csv
        attributes = %w{  store_name  tid  store_id  txn_id  name card_type  card_colour  amount  date }
       

        CSV.generate(headers: true) do |csv|
            csv <<attributes

            all.each do |store|
    
                csv<<[
                store.store_name,
                store.city,
                store.store_transactions.pluck(:store_id).join(', ')
            ]
            end
        end
    end

end
