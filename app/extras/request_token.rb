class RequestToken < SimpleDelegator
  include PocketCredentials

  def initialize
    super generate_request_token
  end

  def continue_authorization_url
    "https://getpocket.com/auth/authorize?request_token=#{__getobj__}&redirect_uri=#{redirect_uri}"
  end

  private

  def generate_request_token
    request_token_from_http_response_body["code"]
  end

  def request_token_from_http_response_body
    Hash[URI.decode_www_form(request_token_from_http.body)]
  end

  def request_token_from_http
    Typhoeus.post "https://getpocket.com/v3/oauth/request", body: post_body
  end

  def post_body
    { consumer_key: consumer_key, redirect_uri: redirect_uri }
  end
end

