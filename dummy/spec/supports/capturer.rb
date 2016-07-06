require 'capybara/rspec'
require 'eyes_selenium'

module Capturer
	
	attr_reader :default_app_name, :default_test_name, :default_browser_name, :default_platform, :default_browser_version, :default_screen_resolution,
		:default_base_url, :default_screenshot_path, :default_sauce_username

	def initialize
		@default_sauce_access_key = "#{ENV["SAUCE_KEY"]}"

		@default_eyes_access_key  = "#{ENV["EYES_KEY"]}"

		@default_platform = "Windows 8"

		@default_browser_name = "Firefox"

		@default_screen_resolution = "1280x1024"

		@default_browser_version = "28"

		@default_app_name = "DummyStore"

		@default_base_url = "http://e4af5e71.ngrok.io"

		@default_sauce_username = "luthfiswees"

		@default_screenshot_path = "#{Rails.root}/spec/screenshot"
	end
	

	class Driver
		attr_accessor :current_browser, :current_base_url, :current_capability, :current_screenshot_path

		include Capturer

		def initialize
			super()
			init_variable
			start_driver
		end

		def init_variable
			@current_base_url = @default_base_url
			@current_screenshot_path = @default_screenshot_path

			@current_browser_name = @default_browser_name
			@current_test_name = "#{@default_app_name} in #{@current_browser_name} by Capturer"

			@current_capability =  {
		  		:platform => @default_platform,
		  		:browserName => @default_browser_name,
		  		:version => @default_browser_version, 
		  		:screen_resolution => @default_screen_resolution,
		  		:name => @current_test_name
			}

			@current_eyes = Applitools::Eyes.new
			@current_eyes.api_key = @default_eyes_access_key

			@current_driver = Selenium::WebDriver.for(:remote,
   		 	url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
    		desired_capabilities: @current_capability)

			@current_browser = @current_eyes.open(app_name: @default_app_name, test_name: @current_test_name,
            viewport_size: {width: 1024, height: 768}, driver: @current_driver)
		end

		def start_driver
			Capybara.register_driver :remote_driver do |app|
				Capybara::Selenium::Driver.new(app, :browser => @current_browser)
			end
			Capybara.javascript_driver = :webkit
			Capybara.current_driver = :remote_driver
		end

		def set_base_url(base_url)
			@current_base_url = base_url
		end

		def set_screenshot_path(screenshot_path)
			@current_screenshot_path = screenshot_path
		end

		def capture(path, fileName)
			@current_browser.get "#{@current_base_url}/#{path}" 
			@current_eyes.check_window("#{@current_screenshot_path}/#{fileName}")  
		end

		def configuring_driver_name
			if @current_capability[:browserName] == nil || @current_capability[:browserName] == ''
				@current_browser_name = @current_capability[:deviceName]
			else	
				@current_browser_name = @current_capability[:browserName]
			end

			@current_test_name = "#{@default_app_name} in #{@current_browser_name} by Capturer"
			@current_capability[:name] = @current_test_name
		end

		def set_capability(caps)
			@current_capability = caps
			reconfiguring_capability
			start_driver
		end

		def reconfiguring_capability
			configuring_driver_name

			@current_eyes = Applitools::Eyes.new
			@current_eyes.api_key = @default_eyes_access_key

			@current_driver = Selenium::WebDriver.for(:remote,
   		 	url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
    		desired_capabilities: @current_capability)

			@current_browser = @current_eyes.open(app_name: @default_app_name, test_name: @current_test_name,
            viewport_size: {width: 1024, height: 768}, driver: @current_driver)
		end

		def close 
			@current_eyes.close
			@current_browser.quit
		end	
	end	  
end