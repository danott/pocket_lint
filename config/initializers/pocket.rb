require 'pocket'

Pocket.configure do |config|
  config.consumer_key = ENV['POCKET_CONSUMER_KEY']
  config.redirect_uri = ENV['POCKET_REDIRECT_URI']
end
