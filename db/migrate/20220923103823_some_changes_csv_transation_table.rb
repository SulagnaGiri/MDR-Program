class SomeChangesCsvTransationTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :csv_transaction_details, :post, :pos
    add_column :csv_transaction_details, :Contactless, :string
    remove_column :csv_transaction_details, :rubyonrails
  end
end
