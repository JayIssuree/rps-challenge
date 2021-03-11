ENV['RACK_ENV'] = "test"

require './app.rb'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = RockPaperScissors

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

RSpec.configure do |config|

  config.formatter = :documentation

end
