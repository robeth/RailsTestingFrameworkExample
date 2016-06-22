json.array!(@pays) do |pay|
  json.extract! pay, :id, :order_id, :payment_type, :transaction_status, :fraud_status, :gross_amount
  json.url pay_url(pay, format: :json)
end
