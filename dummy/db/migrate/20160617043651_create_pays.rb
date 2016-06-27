class CreatePays < ActiveRecord::Migration
  def change
    create_table :pays do |t|
      t.string :order_id,  :unique => true
      t.string :payment_type
      t.string :transaction_status
      t.string :fraud_status
      t.integer :gross_amount

      t.timestamps null: false
    end

    add_index :pays, [:order_id], :unique => true
    add_foreign_key :orders, :order_id, on_delete: :cascade
  end
end
