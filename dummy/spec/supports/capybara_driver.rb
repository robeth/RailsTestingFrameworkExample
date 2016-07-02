caps = {
  		:platform => "Windows 8",
  		:browserName => "Chrome",
  		:version => "31", 
  		:screen_resolution => "1280x1024"
}

@driver = Selenium::WebDriver.for(:remote,
   		 	:url => "http://luthfiswees:c38b7a3d-81b2-4158-a9b1-dbcb0ce1208b@ondemand.saucelabs.com:80/wd/hub",
    		:desired_capabilities => caps)
@browser = @eyes.open(app_name: 'DummyStore', test_name: 'Dummy Page in Chrome',
            viewport_size: {width: 1024, height: 768}, driver: @driver)

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :remote_driver do |app|
	Capybara::Selenium::Driver.new(app, :browser => @browser)
end	

Capybara.javascript_driver = :webkit
Capybara.current_driver = :remote_driver