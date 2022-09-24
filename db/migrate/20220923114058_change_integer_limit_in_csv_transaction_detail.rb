class ChangeIntegerLimitInCsvTransactionDetail < ActiveRecord::Migration[5.2]
  def change
    change_column :csv_transaction_details, :txn_id, :integer, limit: 8
    change_column :csv_transaction_details, :card_no, :integer, limit: 8
  end
end
