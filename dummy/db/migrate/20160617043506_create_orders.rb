class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id, :null => false, :unique => true
      t.string :item1
      t.string :item2
      t.string :vtweblink

      t.timestamps null: false
    end

    add_index :orders, [:order_id], :unique => true
  end
end
