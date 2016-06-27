Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.javascript_driver = :webkit
Capybara.current_driver = :selenium