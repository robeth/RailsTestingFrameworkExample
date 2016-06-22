require 'rails_helper'

describe "accessing store", :type => :feature do
	
	it "has a link to the store" do
		visit "demo/index"
		click_link "sini"
	end

end