class Store < ApplicationRecord
    paginates_per 20
    max_paginates_per 50
    scope :sorted,lambda { order ("id ASC")}

    has_many :store_transactions , dependent: :destroy 

    require "csv"
    

    # def to_csv
    #     attributes = %w{  store_name  tid  store_id  txn_id  name card_type  card_colour  amount  date }
       

    #     CSV.generate(headers: true) do |csv|
    #         csv <<attributes

    #         all.each do |store|
    
    #             csv<<[
    #             store.store_name,
    #             store.city,
    #             store.store_transactions.pluck(:store_id).join(', ')
    #         ]
    #         end
    #     end
    # end

end
