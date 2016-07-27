# its my code :v
require 'capybara/rspec'

# array_of_driver = [:firefox, :saucelabs, :saucelabs_mobile]
array_of_driver = [:firefox]

task :config_idiff do
	Rails.logger = Logger.new(STDOUT)

	IntegrationDiff.configure do |config|
	    # configure domain to which all images have to be uploaded.
	    config.base_uri = "http://diff.codemancers.com"

	    # configure project name to which images belong to.
	    config.project_name = "DummyStore"

	    # configure api_key required to authorize api access
	    config.api_key = ENV["IDIFF_API_KEY"]

	    # configure js driver which is used for taking screenshots.
	    config.javascript_driver = "poltergeist"

	    # configure service to mock capturing and uploading screenshots
	    config.enable_service = !!ENV["IDIFF_ENABLE"]

	    # configure logger to log messages. optional.
	    config.logger = Rails.logger
	  end
end


task :capturer_bundle => [:config_idiff] do

	include IntegrationDiff::Dsl

	path = "spec/features/page_renders_spec.rb"
	IntegrationDiff.start_multiple_runs(array_of_driver, path)

end

# Single operations example for debugging purpose
# CAPTURER_RUN_ID=714 CAPTURER_DRIVER=fire CAPTURER_TAG=1 rspec spec/features/page_renders_spec.rb