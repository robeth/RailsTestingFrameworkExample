require 'spec_helper'

RSpec.describe Pay, type: :model do
	
	it "shouldn't be nil when instantiated" do
		@pay_variables = FactoryGirl.build(:pay)
		@pay = Pay.create( 	order_id: @pay_variables.order_id,
		 				 	payment_type: @pay_variables.payment_type,
		 				 	transaction_status: @pay_variables.transaction_status,
		 				 	fraud_status: @pay_variables.fraud_status,
		 				 	gross_amount: @pay_variables.gross_amount )

		expect(@pay).not_to eq nil
	end

	it "should have an order id, amount, payment_type, transaction status, and fraud status" do
		@pay_variables = FactoryGirl.build(:pay)
		@pay = Pay.create( 	order_id: @pay_variables.order_id,
		 				 	payment_type: @pay_variables.payment_type,
		 				 	transaction_status: @pay_variables.transaction_status,
		 				 	fraud_status: @pay_variables.fraud_status,
		 				 	gross_amount: @pay_variables.gross_amount )

		 expect(@pay.order_id).to eq(@pay_variables.order_id)
		 expect(@pay.gross_amount).to eq(@pay_variables.gross_amount)
		 expect(@pay.payment_type).to eq(@pay_variables.payment_type)
		 expect(@pay.transaction_status).to eq(@pay_variables.transaction_status)
		 expect(@pay.fraud_status).to eq(@pay_variables.fraud_status)
	end

	it "cannot be stored when there are no order_id" do
		@pay_variables = FactoryGirl.build(:pay)
		expect{ Pay.create(order_id: nil,
		 				payment_type: @pay_variables.payment_type,
		 				transaction_status: @pay_variables.transaction_status,
		 				fraud_status: @pay_variables.fraud_status,
		 				gross_amount: @pay_variables.gross_amount ) }.to raise_error
	end

	it "should have an order object as references" do
		# @pay_variables = FactoryGirl.build(:pay)
		# @pay = Pay.create(
		# 		order_id: @pay_variables.order_id,
		#  		payment_type: @pay_variables.payment_type,
		#  		transaction_status: @pay_variables.transaction_status,
		#  		fraud_status: @pay_variables.fraud_status,
		#  		gross_amount: @pay_variables.gross_amount )
		# expect{@pay.save}.to raise_error
	end
end