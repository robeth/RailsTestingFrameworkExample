require 'rails_helper'

describe 'store operations', :type => :feature do

	before :each do
		@item1 = Faker::Number.number(1)
		@item2 = Faker::Number.number(1)
	end

	it "should allow user to click button to add one Beruang to the cart" do
		visit 'demo/store'
		click_link 'B+'
	end

	it "should allow user to click button to remove one Beruang from the cart" do
		visit 'demo/store'
		click_link 'B-'
	end

	it "should allow user to click button to add one bukan Beruang to the cart" do
		visit 'demo/store'
		click_link 'b+'
	end

	it "should allow user to click button to remove one bukan Beruang from the cart" do
		visit 'demo/store'
		click_link 'b-'
	end

end