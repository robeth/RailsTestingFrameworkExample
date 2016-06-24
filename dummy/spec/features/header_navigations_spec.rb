require 'rails_helper'

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

			# with selenium
			@driver.get(@base_url)
			@driver.find_element(:id, 'nav_home').click
		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/index'
			click_link 'Store'

			# with selenium
			@driver.get(@base_url)
			@driver.find_element(:id, 'nav_store').click
		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/index'
			click_link 'Paylist'

			# with selenium
			@driver.get(@base_url)
			@driver.find_element(:id, 'nav_paylist').click
		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/index'
			click_link 'Payments'

			# with selenium
			@driver.get(@base_url)
			@driver.find_element(:id, 'nav_pay_details').click
		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/index'
			click_link 'Orders'

			# with selenium
			@driver.get(@base_url)
			@driver.find_element(:id, 'nav_order_details').click
		end

	end

	describe "store navigations" do 

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/store'
			click_link 'Home'

			# with selenium
			@driver.get(@base_url + "/demo/store")
			@driver.find_element(:id, 'nav_home').click
		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/store'
			click_link 'Store'

			# with selenium
			@driver.get(@base_url + "/demo/store")
			@driver.find_element(:id, 'nav_store').click
		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/store'
			click_link 'Paylist'

			# with selenium
			@driver.get(@base_url + "/demo/store")
			@driver.find_element(:id, 'nav_paylist').click
		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/store'
			click_link 'Payments'

			# with selenium
			@driver.get(@base_url + "/demo/store")
			@driver.find_element(:id, 'nav_pay_details').click
		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/store'
			click_link 'Orders'

			# with selenium
			@driver.get(@base_url + "/demo/store")
			@driver.find_element(:id, 'nav_order_details').click
		end

	end

	describe "paylist navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Home'

			# with selenium
			@driver.get(@base_url + "/demo/paylist")
			@driver.find_element(:id, 'nav_home').click
		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Store'

			# with selenium
			@driver.get(@base_url + "/demo/paylist")
			@driver.find_element(:id, 'nav_store').click
		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Paylist'

			# with selenium
			@driver.get(@base_url + "/demo/paylist")
			@driver.find_element(:id, 'nav_paylist').click
		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Payments'

			# with selenium
			@driver.get(@base_url + "/demo/paylist")
			@driver.find_element(:id, 'nav_pay_details').click
		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/paylist'
			click_link 'Orders'

			# with selenium
			@driver.get(@base_url + "/demo/paylist")
			@driver.find_element(:id, 'nav_order_details').click
		end

	end

	describe "payments navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Home'

			# with selenium
			@driver.get(@base_url + "/demo/pay_details")
			@driver.find_element(:id, 'nav_home').click
		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Store'

			# with selenium
			@driver.get(@base_url + "/demo/pay_details")
			@driver.find_element(:id, 'nav_store').click
		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Paylist'

			# with selenium
			@driver.get(@base_url + "/demo/pay_details")
			@driver.find_element(:id, 'nav_paylist').click
		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Payments'

			# with selenium
			@driver.get(@base_url + "/demo/pay_details")
			@driver.find_element(:id, 'nav_pay_details').click
		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/pay_details'
			click_link 'Orders'

			# with selenium
			@driver.get(@base_url + "/demo/pay_details")
			@driver.find_element(:id, 'nav_order_details').click
		end

	end

	describe "orders navigations" do

		it "should allow user to navigate to home" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Home'

			# with selenium
			@driver.get(@base_url + "/demo/order_details")
			@driver.find_element(:id, 'nav_home').click
		end

		it "should allow user to navigate to store" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Store'

			# with selenium
			@driver.get(@base_url + "/demo/order_details")
			@driver.find_element(:id, 'nav_store').click
		end

		it "should allow user to navigate to payments list" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Paylist'

			# with selenium
			@driver.get(@base_url + "/demo/order_details")
			@driver.find_element(:id, 'nav_paylist').click
		end

		it "should allow user to navigate to pay list" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Payments'

			# with selenium
			@driver.get(@base_url + "/demo/order_details")
			@driver.find_element(:id, 'nav_pay_details').click
		end

		it "should allow user to navigate to order list" do
			# with capybara
			visit 'demo/order_details'
			click_link 'Orders'

			# with selenium
			@driver.get(@base_url + "/demo/order_details")
			@driver.find_element(:id, 'nav_order_details').click
		end

	end
	
end