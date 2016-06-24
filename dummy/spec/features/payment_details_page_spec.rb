require 'rails_helper'

describe 'payment details page', :type => :feature do 

	it "should allow user to navigate to payments" do
		visit 'demo/pay'
		click_link 'Paylist'
	end

	it "should allow user to go to order page" do
		visit 'demo/pay'
		click_link 'Orders'
	end

	it "should allow user to go to pay page" do
		visit 'demo/pay'
		click_link 'Payments'
	end

end