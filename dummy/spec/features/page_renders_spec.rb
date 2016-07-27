require_relative '../rails_helper'
require_relative '../supports/capturer'
require 'capybara/rspec'
require 'eyes_selenium'

describe 'page renders' do

	before :all do

		@default_sauce_access_key = "#{ENV["SAUCE_KEY"]}"

		@default_eyes_access_key  = "#{ENV["EYES_KEY"]}"

		@default_platform = "Windows 8"

		@default_browser_name = "Firefox"

		@default_screen_resolution = "1280x1024"

		@default_browser_version = "28"

		@default_app_name = "Dummy"

		@default_base_url = "localhost:3000"

		@default_sauce_username = "luthfiswees2"

		@default_screenshot_path = "#{Rails.root}/spec/screenshot"

		@default_batch_name = "DummyProject"

		# @caps = {
  # 				:platform => "Windows 10",
  # 				:browserName => "Chrome",
  # 				:version => "31", 
  # 				:screen_resolution => "1280x1024"
		# 	}

		# @caps_mobile = Selenium::WebDriver::Remote::Capabilities.iphone()
		# @caps_mobile['deviceName'] = 'iPhone 5s'
		# @caps_mobile['deviceOrientation'] = 'portrait'
		# @caps_mobile['platformName'] = 'iOS'
		# @caps_mobile['browserName'] = 'Safari' 

		@current_base_url = @default_base_url
		@current_screenshot_path = @default_screenshot_path

		@current_browser_name = @default_browser_name
		@current_test_name = "#{@default_app_name} in #{@current_browser_name} by Capturer"

		@current_batch = Applitools::Base::BatchInfo.new("test_name")

		FactoryGirl.create(:order)
		FactoryGirl.create(:pay)
		# @capturer = Capturer::Driver.new
		# @capturer.set_app_name("Capturer")
		# @capturer.set_capability(@caps)
		# Capybara.current_driver = :saucelabs_mobile
	end

	after :each do
		# if @capturer.not_closed? then
			# @capturer.close
		# end
	end

	# it "should render successfully" do
 #  		@capturer.capture('demo/index', "home_page")
 #  		@capturer.capture('demo/store', "store_page")
 #  		@capturer.capture('demo/paylist', "paylist_page")
	# end

	it "should render Applitools with SauceLabs in Browser" do 
		# 	@capturer.capture('demo/index', "home_page")
  		# 	@capturer.capture('demo/store', "store_page")
  		# 	@capturer.capture('demo/paylist', "paylist_page")

  # 		@current_capability =  {
		#   		:platform => "Windows 10",
  # 				:browserName => "Chrome",
  # 				:version => "31", 
  # 				:screen_resolution => "1280x1024",
		#   		:name => "Chrome test"
		# }

		# @current_eyes = Applitools::Eyes.new
		# @current_eyes.api_key = @default_eyes_access_key
		# @current_eyes.batch = @current_batch

		# @current_driver = Selenium::WebDriver.for(:remote,
  #  		 	url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
  #   		desired_capabilities: @current_capability)
		# @current_driver.manage.timeouts.implicit_wait = 10 # seconds
		# @current_driver.get "http://www.google.com"
		# @current_driver.save_screenshot "#{Rails.root}/spec/screenshot/#{Time.now.to_i}_browser.png"

		# @current_browser = @current_eyes.open(app_name: @default_app_name, test_name: "Chrome test",
  #          	viewport_size: {width: 1024, height: 768}, driver: @current_driver)

		# @current_browser.get "#{@current_base_url}/demo/index"  
		# @current_eyes.check_window("#{@current_screenshot_path}/index")
		byebug
		visit 'demo/index'
		idiff.screenshot "home_page"
		# visit 'demo/store'
		# idiff.screenshot "store_page"
		# visit 'demo/paylist'
		# idiff.screenshot "paylist_page"

		# @current_eyes.close
		# @current_eyes.abort_if_not_closed
		# @current_driver.quit
	end

	# it "should render Applitools with SauceLabs in Browser from Local" do
	# 	@capturer.set_base_url_to_local_rails
	# 	@capturer.capture('demo/index', "home_page")
 #  		@capturer.capture('demo/store', "store_page")
 #  		@capturer.capture('demo/paylist', "paylist_page")
	# end

	# it "should render Applitools with SauceLabs in Mobile" do
	# 	# Sadly, Applitools did not support this features

	# 	# @capturer.set_capability(@caps_mobile)
	# 	# @capturer.capture('demo/index',"index")

	# 	time = Time.now.to_i
	# 	wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds

	# 	@caps_mobile = Selenium::WebDriver::Remote::Capabilities.android()
	# 	@caps_mobile['platform'] = 'linux'
	# 	@caps_mobile['version'] = '4.3'
	# 	@caps_mobile['deviceName'] = 'Google Nexus 7 HD Emulator'
	# 	@caps_mobile['deviceOrientation'] = 'portrait'
	# 	@caps_mobile[:name] = 'Selendroid test'

	# 	@current_eyes = Applitools::Eyes.new
	# 	@current_eyes.api_key = @default_eyes_access_key
	# 	@current_eyes.batch = @current_batch

	# 	@current_driver = Selenium::WebDriver.for(:remote,
	# 		url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
	#     	desired_capabilities: @caps_mobile)
	# 	@current_driver.manage.timeouts.implicit_wait = 10 # seconds
	# 	@current_driver.get "http://www.google.com"
	# 	@current_driver.save_screenshot "#{Rails.root}/spec/screenshot/#{time}_test_mobile.png"

	# 	# @current_browser = @current_eyes.open(app_name: @default_app_name, test_name: 'iPhone test',
 #  #          	viewport_size: {width: 1024, height: 768}, driver: @current_driver)

	# 	# # @current_browser.get "#{@current_base_url}/demo/index"
	# 	# @current_browser.get "#{Rails.root}/spec/screenshot/#{time}_test_mobile.png"  
	# 	# @current_eyes.check_window("#{@current_screenshot_path}/index_selendroid")
	# 	# @current_eyes.close
	# 	# @current_eyes.abort_if_not_closed
	# 	@current_driver.quit
	# end

	# it "should render Applitools with SauceLabs in Mobile using Appium (Android)" do
	# 	wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds

	# 	@caps_mobile = Selenium::WebDriver::Remote::Capabilities.android()
	# 	@caps_mobile['appiumVersion'] = '1.5.3'
	# 	@caps_mobile['deviceName'] = 'Amazon Kindle Fire HD 8.9 GoogleAPI Emulator'
	# 	@caps_mobile['deviceOrientation'] = 'portrait'
	# 	@caps_mobile['browserName'] = 'Browser'
	# 	@caps_mobile['platformVersion'] = '4.4'
	# 	@caps_mobile['platformName'] = 'Android'
	# 	@caps_mobile[:name] = 'Appium Android test'

	# 	@current_eyes = Applitools::Eyes.new
	# 	@current_eyes.api_key = @default_eyes_access_key
	# 	@current_eyes.batch = @current_batch

	# 	@current_driver = Selenium::WebDriver.for(:remote,
	# 		url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
	#     	desired_capabilities: @caps_mobile)
	# 	@current_driver.manage.timeouts.implicit_wait = 10 # seconds
	# 	@current_driver.get "http://www.google.com"
	# 	@current_driver.save_screenshot "#{Rails.root}/spec/screenshot/#{Time.now.to_i}_test_mobile_android.png"

	# 	# @current_browser = @current_eyes.open(app_name: @default_app_name, test_name: 'iPhone test',
 #  #          	viewport_size: {width: 1024, height: 768}, driver: @current_driver)

	# 	# @current_browser.get "#{@current_base_url}/demo/index"  
	# 	# @current_eyes.check_window("#{@current_screenshot_path}/index")
	# 	# @current_eyes.close
	# 	# @current_eyes.abort_if_not_closed
	# 	@current_driver.quit
	# end

	# it "should render Applitools with SauceLabs in Mobile using Appium (iPhone)" do 
	# 	wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds

	# 	@caps_mobile = Selenium::WebDriver::Remote::Capabilities.iphone()
	# 	@caps_mobile['appiumVersion'] = '1.5.3'
	# 	@caps_mobile['deviceName'] = 'iPhone Simulator'
	# 	@caps_mobile['deviceOrientation'] = 'portrait'
	# 	@caps_mobile['platformVersion'] = '8.2'
	# 	@caps_mobile['platformName'] = 'iOS'
	# 	@caps_mobile['browserName'] = 'Safari'
	# 	@caps_mobile[:launchTimeout] = 20000 
	# 	@caps_mobile[:screenshotWaitTimeout] = 15
	# 	@caps_mobile[:name] = 'Appium iPhone test'

	# 	@current_eyes = Applitools::Eyes.new
	# 	@current_eyes.api_key = @default_eyes_access_key
	# 	@current_eyes.batch = @current_batch

	# 	@current_driver = Selenium::WebDriver.for(:remote,
	# 		url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
	#     	desired_capabilities: @caps_mobile)
	# 	@current_driver.manage.timeouts.implicit_wait = 10 # seconds
	# 	@current_driver.get "http://www.google.com"
	# 	@current_driver.save_screenshot "#{Rails.root}/spec/screenshot/#{Time.now.to_i}_test_mobile_iphone.png"

	# 	# @current_browser = @current_eyes.open(app_name: @default_app_name, test_name: 'iPhone test',
 #  #          	viewport_size: {width: 1024, height: 768}, driver: @current_driver)

	# 	# @current_browser.get "#{@current_base_url}/demo/index"  
	# 	# @current_eyes.check_window("#{@current_screenshot_path}/index")
	# 	# @current_eyes.close
	# 	# @current_eyes.abort_if_not_closed
	# 	@current_driver.quit
	# end
	
	# it "should render index page" do
	# 	visit 'demo/index'
	# 	save_and_open_page # saves current snapshot of page
	# 	print page.html
	# 	# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/home.png") # save screenshot
		
	# 	# with percy
	# 	Percy::Capybara.snapshot(page, name: "home_page")
	# end

	# it "should render store page" do
	# 	visit 'demo/store'
	# 	save_and_open_page # saves current snapshot of page
	# 	print page.html
	# 	# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/store.png") # save screenshot

	# 	# with percy
	# 	Percy::Capybara.snapshot(page, name: "store_page")
	# end

	# it "should render paylist page" do
	# 	visit 'demo/paylist'
	# 	save_and_open_page # saves current snapshot of page
	# 	print page.html
	# 	# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/paylist.png") # save screenshot

	# 	# with percy
	# 	Percy::Capybara.snapshot(page, name: "paylist_page")
	# end

	# it "should render Veritrans Payment Web" do 
	# 	# visit 'demo/pay_transaction'
	# 	# save_and_open_page # saves current snapshot of page
	# 	# print page.html
	# 	# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/veritrans-payment.png") # save screenshot
	# end

end