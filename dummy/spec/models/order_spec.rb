require 'spec_helper'

RSpec.describe Order, type: :model do
	
	it "shouldn't be nil when instantiated" do 
		@order_variables = FactoryGirl.build(:order)
		@order = Order.create(
					order_id: @order_variables.order_id, 
					item1: @order_variables.item1,
					item2: @order_variables.item2,
					vtweblink: @order_variables.vtweblink )

		expect(@order).not_to eq nil
	end

	it "should have an order id, quantity, and a link within" do
		@order_variables = FactoryGirl.build(:order)
		@order = Order.create(
					order_id: @order_variables.order_id, 
					item1: @order_variables.item1,
					item2: @order_variables.item2,
					vtweblink: @order_variables.vtweblink )

		expect(@order.order_id).to eq @order_variables.order_id
		expect(@order.item1).to eq @order_variables.item1
		expect(@order.item2).to eq @order_variables.item2
		expect(@order.vtweblink).to eq @order_variables.vtweblink
	end

	it "cannot be stored when there are no order id" do
		@order_variables = FactoryGirl.build(:order)
		expect{ Order.create(
				order_id: nil, 
				item1: @order_variables.item1,
				item2: @order_variables.item2,
				vtweblink: @order_variables.vtweblink ) }.to raise_error
	end
end