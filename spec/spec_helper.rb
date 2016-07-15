if ENV['SIMPLECOV']
  require 'simplecov'
  SimpleCov.start :rails
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'rspec/retry'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures = false
  config.mock_with :rspec

  config.verbose_retry = true

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
end

ActiveRecord::Migration.maintain_test_schema!
