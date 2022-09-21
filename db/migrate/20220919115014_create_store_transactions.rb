class CreateStoreTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :store_transactions do |t|
      t.integer :store_id
      t.string  :status
      t.integer :tid
      t.string  :acquirer
      t.string  :card_type
      t.integer :amount

      t.timestamps
    end
  end
end
