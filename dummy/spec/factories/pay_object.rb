require 'rails_helper'

FactoryGirl.define do
	factory :pay do
		order_id 			Faker::Number.number(10).to_s
		payment_type		"credit_card"
		transaction_status  "capture"
		fraud_status 		"ACCEPT"
		gross_amount   		Faker::Number.number(5).to_i
	end
end
