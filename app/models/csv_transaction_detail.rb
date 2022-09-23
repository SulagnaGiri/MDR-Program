class CsvTransactionDetail < ApplicationRecord
    # belongs_to :store

    require "csv"

    def self.import(file)
        csv = File.read(file.path)
        CSV.parse(csv, headers: true).each do |row|
            new_csv_transaction_detail = CsvTransactionDetail.new
            new_csv_transaction_detail.store_name = row['Store Name']
            new_csv_transaction_detail.city = row['City'].to_s.delete("\u0000")
            new_csv_transaction_detail.pos = row['POS'].to_s.delete("\u0000")
            new_csv_transaction_detail.acquirer = row['Acquirer'].to_s.delete("\u0000")
            new_csv_transaction_detail.tid = row['TID'].to_s.delete("\u0000")
            new_csv_transaction_detail.mid = row['MID'].to_s.delete("\u0000")
            new_csv_transaction_detail.batch_no = row['Batch No'].to_s.delete("\u0000")
            new_csv_transaction_detail.card_no = row['Card No'].to_s.delete("\u0000")
            new_csv_transaction_detail.name = row['Name'].to_s.delete("\u0000")
            new_csv_transaction_detail.card_issuer = row['Card Issuer'].to_s.delete("\u0000")
            new_csv_transaction_detail.card_type = row['Card Type'].to_s.delete("\u0000")
            new_csv_transaction_detail.card_network = row['Card Network'].to_s.delete("\u0000")
            new_csv_transaction_detail.card_colour = row['Card Colour'].to_s.delete("\u0000")
            new_csv_transaction_detail.txn_id = row['TxnID'].to_s.delete("\u0000")
            new_csv_transaction_detail.invoice = row['Invoice'].to_s.delete("\u0000")
            new_csv_transaction_detail.approval_code = row['Approval Code'].to_s.delete("\u0000")
            new_csv_transaction_detail.type = row['Type'].to_s.delete("\u0000")
            new_csv_transaction_detail.amount = row['Amount'].to_s.delete("\u0000")
            new_csv_transaction_detail.tip_amount = row['Tip Amount'].to_s.delete("\u0000")
            new_csv_transaction_detail.currency = row['Currency'].to_s.delete("\u0000")
            new_csv_transaction_detail.date = row['Date'].to_s.delete("\u0000")
            new_csv_transaction_detail.status = row['Status'].to_s.delete("\u0000")
            new_csv_transaction_detail.settlement_date = row['SettlementDate'].to_s.delete("\u0000")
            new_csv_transaction_detail.cashier = row['Cashier'].to_s.delete("\u0000")
            new_csv_transaction_detail.bill_invoice = row['Bill Invoice'].to_s.delete("\u0000")
            # new_csv_transaction_detail.rrn = row['RRN'].delete("\u0000")
            # new_csv_transaction_detail.emi_txn = row['EMI Txn']
            # new_csv_transaction_detail.emi_month = row['EMI Month']
            new_csv_transaction_detail.Contactless = row['Contactless'].to_s.delete("\u0000")
            new_csv_transaction_detail.contactless_mode = row['ContactLess Mode'].to_s.delete("\u0000")
            # new_csv_transaction_detail.cloud_ref_id = row['CLOUD REF ID']
            new_csv_transaction_detail.save
        
        end
    
    end
end
