class CreateDailyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_reports do |t|
      # t.integer :store_id
      # t.string   :store_name, null: false
      # t.integer  :tid
      # t.string   :name
      # t.string   :card_type
      # t.string   :card_colour
      # t.integer  :txn_id
      # t.integer  :amount
      # t.integer  :tip_amount
      # t.datetime :date
      # t.datetime :settlement_date
      


      t.timestamps
    end
  end
end
