# capybara-driver.rb by @luthfiswees
# 
# 
# Setting driver writing formats
# for integration-diff edited by @luthfiswees
#
# There are three ways to write driver capabilities in this idiff. First by using
# native browser, Second method by using idiff service to set the drivers,
# and the other by using third party drivers (using SauceLabs).
# I will display those three writing formats over this documents
case ENV['IDIFF_DRIVER']

###################################################################################
# 1. Native browser for Capybara
# 
# This format use native driver from Capybara such as :firefox, :chrome, and such
# The example provided use local firefox as drivers for Capybara and idiff.

when "firefox"

	# register the driver here 
	Capybara.register_driver :used_driver do |app|
	  Capybara::Selenium::Driver.new(app, :browser => :firefox)
	end


###########################################################################
# 2. Saucelabs service for Capybara
#
# This format use SauceLabs to configure SauceLabs drivers in the remote
# The example provided use SauceLabs service to use Google Chrome drivers
# in Windows 8	

when "saucelabs"

	# URL for SauceLabs drivers
	saucelabs_enable = true
	sauce_url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_KEY']}@localhost:4445/wd/hub"

	# register your driver capabilities here
	# Remember, only SauceLabs capability formats that are accepted
	capabilities = {
  		:platform => "Windows 8",
  		:browserName => "Chrome",
  		:version => "31",
  		:screen_resolution => "1280x1024",

  		:name => IntegrationDiff.name_test( ENV['IDIFF_DRIVER'] )
	}

	# setting up the browser over here
	@browser = {
		browser: :remote,
		url: sauce_url,
		desired_capabilities: capabilities
	}

	# register your driver over here 
	# This settings will register your SauceLabs drivers into Capybara drivers
	Capybara.register_driver :used_driver do |app|
	  Capybara::Selenium::Driver.new(app, @browser)
	end

###########################################################################
# 3. Saucelabs mobile service for Capybara
#
# This format use SauceLabs to configure mobile remote drivers provided
# by SauceLabs. 

when "saucelabs_mobile"

	# URL for SauceLabs drivers
	saucelabs_enable = true
	sauce_url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub"

	# register your capabilities here
	# capabilities here are generated by Platform Configurator by @saucelabs
	# You can access it here => https://wiki.saucelabs.com/display/DOCS/Platform+Configurator
	mobile_capabilities = Selenium::WebDriver::Remote::Capabilities.android()
	mobile_capabilities['platform'] = 'linux'
	mobile_capabilities['version'] = '4.2'
	mobile_capabilities['deviceName'] = 'Samsung Galaxy Tab 3 Emulator'
	mobile_capabilities['deviceOrientation'] = 'portrait'
	mobile_capabilities[:name] = IntegrationDiff.name_test ENV['IDIFF_DRIVER']

	# setting up the browser over here
	@mobile_browser = {
		browser: :remote,
		url: sauce_url,
		desired_capabilities: mobile_capabilities
	}

	# register your driver over here 
	# This settings will register your SauceLabs drivers into Capybara drivers
	Capybara.register_driver :used_driver do |app|
	  Capybara::Selenium::Driver.new(app, @mobile_browser)
	end    			

else 
	#  default driver if not specified
	Capybara.register_driver :used_driver do |app|
	  Capybara::Selenium::Driver.new(app, :browser => :firefox)
	end
end

# register the selected drivers as current driver used
Capybara.current_driver = :used_driver

	# ################################
	# # capabilities for remote driver
	# ################################
	# caps = {
 #  		:platform => "Windows 8",
 #  		:browserName => "Chrome",
 #  		:version => "31", 
 #  		:screen_resolution => "1280x1024",
 #  		:name => "saucelabs browser"
	# }

	# caps_mobile = Selenium::WebDriver::Remote::Capabilities.android()
	# caps_mobile['platform'] = 'linux'
	# caps_mobile['version'] = '4.2'
	# caps_mobile['deviceName'] = 'Samsung Galaxy Tab 3 Emulator'
	# caps_mobile['deviceOrientation'] = 'portrait'
	# caps_mobile[:name] = "saucelabs mobile"

	# ############################################
	# # driver from remote settings with saucelabs
	# ############################################
	# @driver = Selenium::WebDriver.for(:remote,
	#    		 	:url => "http://luthfiswees2:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub",
	#     		:desired_capabilities => caps)

	# @driver_mobile = Selenium::WebDriver.for(:remote,
	#    		 	:url => "http://luthfiswees2:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub",
	#     		:desired_capabilities => caps_mobile )

	# ###########################
	# # setting up remote browser
	# ###########################
	# @browser = {
	# 	browser: :remote,
	# 	url: "http://luthfiswees2:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub",
	# 	desired_capabilities: caps
	# }

	# @mobile_browser = {
	# 	browser: :remote,
	# 	url: "http://luthfiswees2:#{ENV['SAUCE_KEY']}@ondemand.saucelabs.com:80/wd/hub",
	# 	desired_capabilities: caps_mobile
	# }

	# #################
	# # register driver
	# #################
	# Capybara.register_driver :default do |app|
	#   Capybara::Selenium::Driver.new(app, :browser => :firefox)
	# end

	# Capybara.register_driver :fire do |app|
	#   Capybara::Selenium::Driver.new(app, :browser => :firefox)
	# end

	# Capybara.register_driver :saucelabs do |app|
	# 	Capybara::Selenium::Driver.new(app, @browser)
	# end	

	# Capybara.register_driver :saucelabs_mobile do |app|
	# 	Capybara::Selenium::Driver.new(app, @mobile_browser)
	# end

	# Capybara.javascript_driver = :poltergeist
	# if ENV['CAPTURER_DRIVER'] == nil
	# 	Capybara.current_driver = :default
	# else
	# 	Capybara.current_driver = ENV['CAPTURER_DRIVER'].to_sym
	# end