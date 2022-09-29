class ChangeIntegerLimitInStoreTransaction < ActiveRecord::Migration[5.2]
  def change
    change_column :store_transactions, :txn_id, :integer, limit: 8
    change_column :store_transactions, :card_no, :integer, limit: 8
  end
end
