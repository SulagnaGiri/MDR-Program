class SomeChangesCsvTransationTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :csv_transaction_details, :post, :pos
    add_column :csv_transaction_details, :Contactless, :string
    remove_column :csv_transaction_details, :rubyonrails
    # change_column(:csv_transaction_details, :txn_id, :long)
    # change_column(:csv_transaction_details, :card_no, :long)
  end
end
