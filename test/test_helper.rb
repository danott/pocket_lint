ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'minitest/spec'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures [:people]

  # Add more helper methods to be used by all tests here...
end

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.filter_sensitive_data('<POCKET_CONSUMER_KEY>') { ENV['POCKET_CONSUMER_KEY'] }
  c.filter_sensitive_data('<POCKET_REDIRECT_URI>') { ENV['POCKET_REDIRECT_URI'] }
end
