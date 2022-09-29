class CreateCsvTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :csv_transaction_details do |t|
      # t.string   :store_name, null: false
      # t.string   :city
      # t.integer  :pos
      # t.string   :acquirer
      # t.integer  :tid
      # t.integer  :mid
      # t.integer  :batch_no
      # t.integer  :card_no
      # t.string   :name
      # t.string   :card_issuer
      # t.string   :card_type
      # t.string   :card_network
      # t.string   :card_colour
      # t.integer  :txn_id
      # t.integer  :invoice
      # t.integer  :approval_code
      # t.string   :type
      # t.integer  :amount
      # t.integer  :tip_amount
      # t.string   :currency
      # t.datetime :date
      # t.string   :status
      # t.datetime :settlement_date
      # t.string   :cashier
      # t.integer  :bill_invoice
      # t.integer  :rrn
      # t.integer  :emi_txn
      # t.integer  :emi_month
      # t.string   :contactless
      # t.string   :cloud_ref_id

      

      t.timestamps
    end
  end
  # def down
  #   drop_table :csv_transaction_details 
  # end
end
