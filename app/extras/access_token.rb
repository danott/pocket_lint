class AccessToken < SimpleDelegator
  include PocketCredentials
  class TokenUnobtainable < StandardError; end

  attr_reader :request_token

  def initialize(request_token)
    @request_token = request_token
    super initialize_from_request_token
  end

  def name
    response_body["username"]
  end

  private

  def initialize_from_request_token
    response_body["access_token"]
  end

  def response_body
    begin
      @response_body ||= Hash[URI.decode_www_form(access_token_from_http.body)]
    rescue
      raise TokenUnobtainable
    end
  end

  def access_token_from_http
    Typhoeus.post "https://getpocket.com/v3/oauth/authorize", body: post_body
  end

  def post_body
    { consumer_key: consumer_key, code: request_token }
  end
end
