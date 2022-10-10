class CreateStores < ActiveRecord::Migration[5.2]
  def up
    create_table :stores do |t|
      t.string  :store_name ,:limit=>100 ,:null=>false
      t.string  :city,:limit=>40
      # t.integer :pos
      # t.integer :tid,:null=>false
      # t.string   :card_network

      t.timestamps
    end
  end
  
  
  def down
    drop_table :stores
  end
  
end 
