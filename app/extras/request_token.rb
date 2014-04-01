class RequestToken < SimpleDelegator
  def initialize
    super Pocket.get_code(redirect_uri: PocketCredentials.redirect_uri)
  end

  def continue_authorization_url
    Pocket.authorize_url(code: __getobj__, redirect_uri: PocketCredentials.redirect_uri)
  end
end
