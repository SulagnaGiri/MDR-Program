class AddStoreReferenceToStoreTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :store_transactions, :store, foreign_key: true
  end
end
