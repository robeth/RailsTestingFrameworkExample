# caps = {
#   		:platform => "Windows 8",
#   		:browserName => "Chrome",
#   		:version => "31", 
#   		:screen_resolution => "1280x1024"
# }

# @driver = Selenium::WebDriver.for(:remote,
#    		 	:url => "http://luthfiswees:c38b7a3d-81b2-4158-a9b1-dbcb0ce1208b@ondemand.saucelabs.com:80/wd/hub",
#     		:desired_capabilities => caps)
# @browser = @eyes.open(app_name: 'DummyStore', test_name: 'Dummy Page in Chrome',
#             viewport_size: {width: 1024, height: 768}, driver: @driver)

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :firefox)
# end

# Capybara.register_driver :remote_driver do |app|
# 	Capybara::Selenium::Driver.new(app, :browser => @browser)
# end	

# Capybara.javascript_driver = :webkit
# Capybara.current_driver = :remote_driver

require_relative '../rails_helper'
require 'capybara/rspec'
require 'eyes_selenium'

module Capturer
	
	attr_reader :default_app_name, :default_test_name, :default_browser_name, :default_platform, :default_browser_version, :default_screen_resolution,
		:default_base_url, :default_screenshot_path, :default_sauce_username

	def initialize
		@default_sauce_access_key = "c38b7a3d-81b2-4158-a9b1-dbcb0ce1208b"

		@default_eyes_access_key = "3no5g96gEuGXfnJd4qisQUyaRn24bEXNIBAKcqCngHM110"

		@default_platform = "Windows 8"

		@default_browser_name = "Firefox"

		@default_screen_resolution = "1280x1024"

		@default_browser_version = "28"

		@default_app_name = "DummyStore"

		@default_base_url = "http://e4af5e71.ngrok.io"

		@default_sauce_username = "luthfiswees"

		@default_screenshot_path = "#{Rails.root}/spec/screenshot"

		@default_test_name = "#{@default_app_name} in #{@default_browser_name} by Capturer"
	end
	

	class Driver
		attr_accessor :current_browser, :base_url, :capability, :current_screenshot_path

		include Capturer

		def initialize
			super()
			init_variable
			reinit
			start_driver
		end

		def init_variable 
			@default_capability =  {
		  		:platform => @default_platform,
		  		:browserName => @default_browser_name,
		  		:version => @default_browser_version, 
		  		:screen_resolution => @default_screen_resolution
			}

			@default_eyes = Applitools::Eyes.new
			@default_eyes.api_key = @default_eyes_access_key

			@default_driver = Selenium::WebDriver.for(:remote,
   		 	url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
    		desired_capabilities: @default_capability)

			@default_browser = @default_eyes.open(app_name: @default_app_name, test_name: @default_test_name,
            viewport_size: {width: 1024, height: 768}, driver: @default_driver)
		end

		def reinit
			if @current_browser == nil
				@current_browser = @default_browser
			end
		end

		def reset
			@current_browser			= @default_browser
			@base_url 					= @default_base_url
			@capability     			= @default_capability
			@current_screenshot_path	= @default_screenshot_path
		end	

		def start_driver
			Capybara.register_driver :remote_driver do |app|
				Capybara::Selenium::Driver.new(app, :browser => @default_browser)
			end
			Capybara.javascript_driver = :webkit
			Capybara.current_driver = :remote_driver

		end

		def capture(path, fileName)
			@current_browser.get "#{@default_base_url}/#{path}" 
			@default_eyes.check_window("#{@default_screenshot_path}/#{fileName}")  
		end

		def get_eyes
			return @default_eyes
		end

		def close 
			@default_eyes.close
			@default_driver.quit
			@current_browser.quit
		end	
	end	  
end