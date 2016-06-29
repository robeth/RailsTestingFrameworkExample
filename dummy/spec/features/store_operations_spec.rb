require 'selenium-webdriver'
require_relative '../rails_helper'

describe 'store operations', :type => :feature do

	before :each do 
		Capybara.javascript_driver = :webkit
		Capybara.current_driver = :selenium
	end

	it "should allow user to click button to add one Beruang to the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'Bplus' 
	end

	it "should allow user to click button to remove one Beruang from the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'Bmin'
	end

	it "should allow user to click button to add one bukan Beruang to the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'bplus'
	end

	it "should allow user to click button to remove one bukan Beruang from the cart" do
		# with capybara
		visit 'demo/store'
		click_link 'bmin'
	end

	it "could perform payment initiations" do
		# with selenium 
		# @driver.get(@base_url)
		# @driver.find_element(:id, 'pay_button').click 
	end

end