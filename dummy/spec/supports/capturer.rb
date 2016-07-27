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

		@default_app_name = "Dummy"

		@default_base_url = "http://b2561566.ngrok.io"

		@default_sauce_username = "luthfiswees"

		@default_screenshot_path = "#{Rails.root}/spec/screenshot"

		@default_batch_name = "DummyProject"

		@closed = false
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

		def set_app_name(project_name) 
			@default_app_name = project_name
		end

		def set_batch
			@current_batch_name = "#{@default_app_name} in #{@current_capability[:browserName]}-#{@current_capability[:version]}"
			@current_batch = Applitools::Base::BatchInfo.new(@current_batch_name)
			reconfiguring_capability
			start_driver
		end

		def set_base_url(base_url)
			@current_base_url = base_url
			reconfiguring_capability
			start_driver
		end

		def set_base_url_to_local_rails 
			@current_base_url = "localhost:3000"
			reconfiguring_capability
			start_driver
		end

		def set_screenshot_path(screenshot_path)
			@current_screenshot_path = screenshot_path
		end

		def capture(path, fileName)
			if @closed then
				reconfiguring_capability
				start_driver

				@closed = false
			end

			@current_browser.get "#{@current_base_url}/#{path}" 
			@current_eyes.check_window("#{@current_screenshot_path}/#{fileName}")  
		end

		def capture_url(url, fileName)
			if @closed then
				reconfiguring_capability
				start_driver

				@closed = false
			end

			@current_browser.get "#{url}" 
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
			set_batch
		end

		def reconfiguring_capability
			configuring_driver_name
			
			@current_eyes = Applitools::Eyes.new
			@current_eyes.api_key = @default_eyes_access_key
			@current_eyes.batch = @current_batch

			@current_driver = Selenium::WebDriver.for(:remote,
   		 	url: "http://#{@default_sauce_username}:#{@default_sauce_access_key}@ondemand.saucelabs.com:80/wd/hub",
    		desired_capabilities: @current_capability)

			@current_browser = @current_eyes.open(app_name: @default_app_name, test_name: @current_test_name,
            viewport_size: {width: 1024, height: 768}, driver: @current_driver)
		end

		def not_closed?
			return !@closed
		end

		def close 
			@current_eyes.close
			@current_browser.quit

			@closed = true
		end	
	end	  
end