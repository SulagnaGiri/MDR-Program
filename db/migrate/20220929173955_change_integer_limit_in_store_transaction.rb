class ChangeIntegerLimitInStoreTransaction < ActiveRecord::Migration[5.2]
  def up
    change_column :store_transactions, :txn_id, :float
    change_column :store_transactions, :card_no, :float
  end
  def down
    change_column :store_transactions, :txn_id, :integer
    change_column :store_transactions, :card_no, :integer
  end
end
