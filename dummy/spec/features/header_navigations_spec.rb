require 'rails_helper'

describe "header navigations" do
	
	describe "index navigations" do

		it "should allow user to navigate to home" do
			visit 'demo/index'
			click_link 'Home'
		end

		it "should allow user to navigate to store" do
			visit 'demo/index'
			click_link 'Store'
		end

		it "should allow user to navigate to payments list" do
			visit 'demo/index'
			click_link 'Paylist'
		end

		it "should allow user to navigate to pay list" do
			visit 'demo/index'
			click_link 'Payments'
		end

		it "should allow user to navigate to order list" do
			visit 'demo/index'
			click_link 'Orders'
		end

	end

	describe "store navigations" do 

		it "should allow user to navigate to home" do
			visit 'demo/store'
			click_link 'Home'
		end

		it "should allow user to navigate to store" do
			visit 'demo/store'
			click_link 'Store'
		end

		it "should allow user to navigate to payments list" do
			visit 'demo/store'
			click_link 'Paylist'
		end

		it "should allow user to navigate to pay list" do
			visit 'demo/store'
			click_link 'Payments'
		end

		it "should allow user to navigate to order list" do
			visit 'demo/store'
			click_link 'Orders'
		end

	end

	describe "paylist navigations" do

		it "should allow user to navigate to home" do
			visit 'demo/paylist'
			click_link 'Home'
		end

		it "should allow user to navigate to store" do
			visit 'demo/paylist'
			click_link 'Store'
		end

		it "should allow user to navigate to payments list" do
			visit 'demo/paylist'
			click_link 'Paylist'
		end

		it "should allow user to navigate to pay list" do
			visit 'demo/paylist'
			click_link 'Payments'
		end

		it "should allow user to navigate to order list" do
			visit 'demo/paylist'
			click_link 'Orders'
		end

	end

	describe "payments navigations" do

		it "should allow user to navigate to home" do
			visit 'demo/pay_details'
			click_link 'Home'
		end

		it "should allow user to navigate to store" do
			visit 'demo/pay_details'
			click_link 'Store'
		end

		it "should allow user to navigate to payments list" do
			visit 'demo/pay_details'
			click_link 'Paylist'
		end

		it "should allow user to navigate to pay list" do
			visit 'demo/pay_details'
			click_link 'Payments'
		end

		it "should allow user to navigate to order list" do
			visit 'demo/pay_details'
			click_link 'Orders'
		end

	end

	describe "orders navigations" do

		it "should allow user to navigate to home" do
			visit 'demo/order_details'
			click_link 'Home'
		end

		it "should allow user to navigate to store" do
			visit 'demo/order_details'
			click_link 'Store'
		end

		it "should allow user to navigate to payments list" do
			visit 'demo/order_details'
			click_link 'Paylist'
		end

		it "should allow user to navigate to pay list" do
			visit 'demo/order_details'
			click_link 'Payments'
		end

		it "should allow user to navigate to order list" do
			visit 'demo/order_details'
			click_link 'Orders'
		end

	end
	
end