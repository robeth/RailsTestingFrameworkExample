require 'rails_helper'

describe 'store operations', :type => :feature do

	before :each do
		@driver = Selenium::WebDriver.for :firefox
		@base_url = 'localhost:3000/demo/store?jumlahBeruang1=1&jumlahBeruang2=1'
		@driver.manage.timeouts.implicit_wait = 30
	end

	after :each do
		@driver.quit
	end

	it "should allow user to click button to add one Beruang to the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'B+'

		# with selenium
		@driver.get(@base_url)
		@driver.find_element(:id, 'B+').click
	end

	it "should allow user to click button to remove one Beruang from the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'B-'

		# with selenium
		@driver.get(@base_url)
		@driver.find_element(:id, 'B-').click
	end

	it "should allow user to click button to add one bukan Beruang to the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'b+'

		# with selenium
		@driver.get(@base_url)
		@driver.find_element(:id, 'b+').click
	end

	it "should allow user to click button to remove one bukan Beruang from the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'b-'

		# with selenium
		@driver.get(@base_url)
		@driver.find_element(:id, 'b-').click 
	end

	it "could perform payment initiations" do
		# with selenium 
		@driver.get(@base_url)
		@driver.find_element(:id, 'pay_button').click 
	end

end