class AlterCsvTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column("csv_transaction_details","contactless_mode",:string,:after =>"contactless")
  end
end
