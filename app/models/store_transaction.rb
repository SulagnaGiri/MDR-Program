class StoreTransaction < ApplicationRecord
    belongs_to :store
    has_many :daily_reports
    has_many :weekly_reports
    has_many :monthly_reports
    self.inheritance_column = :_type_disabled
    


    require "csv"
    

    def self.import(file)
        csv = File.read(file.path)
        CSV.parse(csv, headers: true).each do |row|

              @store = Store.find_or_create_by(store_name: row['Store Name'] ,city: row['City'])

            new_store_transaction = @store.store_transactions.new
            # new_store_transaction.store_name = row['Store Name']
            # new_store_transaction.city = row['City'].to_s.delete("\u0000")
            new_store_transaction.pos = row['POS'].to_s.delete("\u0000")
            new_store_transaction.acquirer = row['Acquirer'].to_s.delete("\u0000")
            new_store_transaction.tid = row['TID'].to_s.delete("\u0000")
            new_store_transaction.mid = row['MID'].to_s.delete("\u0000")
            new_store_transaction.batch_no = row['Batch No'].to_s.delete("\u0000")
            new_store_transaction.card_no = row['Card No'].to_s.delete("\u0000")
            new_store_transaction.name = row['Name'].to_s.delete("\u0000")
            new_store_transaction.card_issuer = row['Card Issuer'].to_s.delete("\u0000")
            new_store_transaction.card_type = row['Card Type'].to_s.delete("\u0000")
            new_store_transaction.card_network = row['Card Network']
            new_store_transaction.card_colour = row['Card Colour'].to_s.delete("\u0000")
            new_store_transaction.txn_id = row['TxnID'].to_s.delete("\u0000")
            new_store_transaction.invoice = row['Invoice'].to_s.delete("\u0000")
            new_store_transaction.approval_code = row['Approval Code'].to_s.delete("\u0000")
            new_store_transaction.type = row['Type'].to_s.delete("\u0000")
            new_store_transaction.amount = row['Amount'].to_s.delete("\u0000")
            new_store_transaction.tip_amount = row['Tip Amount'].to_s.delete("\u0000")
            new_store_transaction.currency = row['Currency'].to_s.delete("\u0000")
            new_store_transaction.date = row['Date'].to_s.delete("\u0000")
            new_store_transaction.status = row['Status'].to_s.delete("\u0000")
            new_store_transaction.settlement_date = row['SettlementDate'].to_s.delete("\u0000")
            new_store_transaction.cashier = row['Cashier'].to_s.delete("\u0000")
            new_store_transaction.bill_invoice = row['Bill Invoice'].to_s.delete("\u0000")
            new_store_transaction.contactless = row['Contactless'].to_s.delete("\u0000")
            # new_store_transaction.contactless_mode = row['ContactLess Mode'].to_s.delete("\u0000")
            new_store_transaction.save
        
        end
    end
    
end
