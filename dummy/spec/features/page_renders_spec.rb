require_relative '../rails_helper'
require_relative '../supports/capturer'
require 'capybara/rspec'
require 'eyes_selenium'

describe 'page renders' do

	let(:eyes) do
        Applitools::Eyes.new
    end

	before :all do
		@caps = {
  				:platform => "Windows 10",
  				:browserName => "Chrome",
  				:version => "31", 
  				:screen_resolution => "1280x1024"
			}

		@caps_mobile = Selenium::WebDriver::Remote::Capabilities.android()
		@caps_mobile['platform'] = 'linux'
		@caps_mobile['version'] = '4.3'
		@caps_mobile['deviceName'] = 'Google Nexus 7 HD Emulator'
		@caps_mobile['deviceOrientation'] = 'portrait'

		FactoryGirl.create(:order)
		FactoryGirl.create(:pay)
		@time = Time.now.to_i
	end

	it "should render successfully" do 
  		@capturer = Capturer::Driver.new
  		@capturer.capture('demo/index', "home_page")
  		@capturer.capture('demo/store', "store_page")
  		@capturer.capture('demo/paylist', "paylist_page")
  		@capturer.close
	end

	it "should render Applitools with SauceLabs in Browser" do 
		@capturer = Capturer::Driver.new
		@capturer.set_capability(@caps)
		@capturer.capture('demo/index', "home_page")
  		@capturer.capture('demo/store', "store_page")
  		@capturer.capture('demo/paylist', "paylist_page")
  		@capturer.close
	end

	it "should render Applitools with SauceLabs in Browser from Local" do
		@capturer = Capturer::Driver.new
		@capturer.set_base_url_to_local_rails
		@capturer.set_capability(@caps)
		@capturer.capture('demo/index', "home_page")
  		@capturer.capture('demo/store', "store_page")
  		@capturer.capture('demo/paylist', "paylist_page")
  		@capturer.close
	end

	it "should render Applitools with SauceLabs in Mobile" do
		# Sadly, Applitools did not support this features

		# @capturer = Capturer::Driver.new
		# @capturer.set_capability(@caps_mobile)
		# @capturer.capture('demo/index', "home_page")
  		# @capturer.capture('demo/store', "store_page")
  		# @capturer.capture('demo/paylist', "paylist_page")
  		# @capturer.close
	end
	
	it "should render index page" do
		visit 'demo/index'
		save_and_open_page # saves current snapshot of page
		print page.html
		# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/home.png") # save screenshot
		
		# with percy
		Percy::Capybara.snapshot(page, name: "home_page")
	end

	it "should render store page" do
		visit 'demo/store'
		save_and_open_page # saves current snapshot of page
		print page.html
		# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/store.png") # save screenshot

		# with percy
		Percy::Capybara.snapshot(page, name: "store_page")
	end

	it "should render paylist page" do
		visit 'demo/paylist'
		save_and_open_page # saves current snapshot of page
		print page.html
		# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/paylist.png") # save screenshot

		# with percy
		Percy::Capybara.snapshot(page, name: "paylist_page")
	end

	it "should render Veritrans Payment Web" do 
		# visit 'demo/pay_transaction'
		# save_and_open_page # saves current snapshot of page
		# print page.html
		# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/veritrans-payment.png") # save screenshot
	end

end