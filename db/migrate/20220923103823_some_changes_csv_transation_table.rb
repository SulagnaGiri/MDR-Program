class SomeChangesCsvTransationTable < ActiveRecord::Migration[5.2]
  def change
    
    add_column :csv_transaction_details, :Contactless, :string
   
    # change_column(:csv_transaction_details, :txn_id, :long)
    # change_column(:csv_transaction_details, :card_no, :long)
  end
end
