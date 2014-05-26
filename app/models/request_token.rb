class RequestToken < SimpleDelegator
  def initialize
    super Pocket.get_code()
  end

  def continue_authorization_url
    Pocket.authorize_url(request_token: __getobj__)
  end
end
