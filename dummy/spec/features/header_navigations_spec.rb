require 'spec_helper'

describe "header navigations" do

	before :each do
		@driver = Selenium::WebDriver.for :firefox
		@base_url = 'localhost:3000'
	end

	after :each do
		@driver.quit
	end
	
	describe "index navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/index'
			click_link 'Home'

		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/index'
			click_link 'Store'
		
		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/index'
			click_link 'Paylist'

		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/index'
			click_link 'Payments'

		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/index'
			click_link 'Orders'

		end

	end

	describe "store navigations" do 

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/store'
			click_link 'Home'

		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/store'
			click_link 'Store'

		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/store'
			click_link 'Paylist'

		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/store'
			click_link 'Payments'

		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/store'
			click_link 'Orders'

		end

	end

	describe "paylist navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Home'

		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Store'

		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Paylist'

		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Payments'

		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Orders'

		end

	end

	describe "payments navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Home'

		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Store'

		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Paylist'

		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Payments'

		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Orders'

		end

	end

	describe "orders navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Home'

		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Store'

		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Paylist'

		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Payments'

		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Orders'

		end

	end
	
end