require 'pocket'

Pocket.configure do |config|
  config.consumer_key = PocketCredentials.consumer_key
  config.redirect_uri = PocketCredentials.redirect_uri
end
