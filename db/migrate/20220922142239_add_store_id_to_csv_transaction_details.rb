class AddStoreIdToCsvTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    add_column("csv_transaction_details","store_id",:integer)

  end
end
