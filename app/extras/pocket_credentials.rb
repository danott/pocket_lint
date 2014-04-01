module PocketCredentials
  def self.consumer_key
    ENV['POCKET_CONSUMER_KEY']
  end

  def self.redirect_uri
    ENV['POCKET_REDIRECT_URI']
  end
end
