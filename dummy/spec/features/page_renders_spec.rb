require_relative '../rails_helper'
require_relative '../supports/capturer'
require 'capybara/rspec'
require 'eyes_selenium'

describe 'page renders' do

	let(:eyes) do
        Applitools::Eyes.new
    end

	before :all do
		@base_url = "http://e4af5e71.ngrok.io"

		caps = {
  				:platform => "Windows 8",
  				:browserName => "Chrome",
  				:version => "31", 
  				:screen_resolution => "1280x1024"
			}

		caps_mobile = {
				:platform => "Windows 8",
  				:browserName => "Firefox",
  				:version => "31", 
  				:screen_resolution => "1280x1024"
			}	

		FactoryGirl.create(:order)
		FactoryGirl.create(:pay)
		@time = Time.now.to_i

		@eyes = Applitools::Eyes.new
		@eyes.api_key = '3no5g96gEuGXfnJd4qisQUyaRn24bEXNIBAKcqCngHM110'

		@driver = Selenium::WebDriver.for(:remote,
   		 	:url => "http://luthfiswees:c38b7a3d-81b2-4158-a9b1-dbcb0ce1208b@ondemand.saucelabs.com:80/wd/hub",
    		:desired_capabilities => caps)
    	@browser = @eyes.open(app_name: 'DummyStore', test_name: 'Dummy Page in Chrome',
                      viewport_size: {width: 1024, height: 768}, driver: @driver)            	
	end

	it "should render successfully" do 
		# eyes.api_key = '3no5g96gEuGXfnJd4qisQUyaRn24bEXNIBAKcqCngHM110'
		# eyes.test(app_name: 'DummyStore', test_name: 'Dummy Page',
  #                     viewport_size: {width: 1366, height: 742}, driver: page.driver.browser) do
  #               visit 'demo/index'
  #               eyes.check_window('home_page')
  #               visit 'demo/store'
  #               eyes.check_window('store_page')
  #               visit 'demo/paylist'
  #               eyes.check_window('paylist_page')
  #       end

  		@capturer = Capturer::Driver.new
  		@capturer.capture('demo/index', "home_page")
  		@capturer.capture('demo/store', "store_page")
  		@capturer.capture('demo/paylist', "paylist_page")
  		@capturer.close
	end

	it "should render Applitools with SauceLabs in Browser" do 
		eyes.test(app_name: 'DummyStore', test_name: 'Dummy Page in Chrome',
                      viewport_size: {width: 1024, height: 768}, driver: @browser) do
			visit "/demo/index"
			@eyes.check_window('home_page_chrome')
			visit "/demo/store"
			@eyes.check_window('store_page_chrome')
			visit "/demo/paylist"
			@eyes.check_window('paylist_page_chrome')
		end	
		@eyes.close
		@browser.close
		@driver.quit
	end

	it "should render Applitools with SauceLabs in Mobile" do
		# @browser_mobile.get "#{@base_url}/demo/index"
		# @eyes.check_window('home_page_chrome')
		# @browser_mobile.get "#{@base_url}/demo/store"
		# @eyes.check_window('store_page_chrome')
		# @browser_mobile.get "#{@base_url}/demo/paylist"
		# @eyes.check_window('paylist_page_chrome')
		# @driver_mobile.quit
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