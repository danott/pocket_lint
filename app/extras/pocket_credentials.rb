module PocketCredentials
  def consumer_key
    ENV['POCKET_CONSUMER_KEY']
  end

  def redirect_uri
    ENV['POCKET_REDIRECT_URI']
  end
end
