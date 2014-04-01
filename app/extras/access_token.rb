class AccessToken < SimpleDelegator
  attr_reader :username

  def initialize(request_token)
    @request_token = request_token
    @username = result['username']
    super result['access_token']
  end

  private

  attr_reader :request_token

  def result
    @result ||= Pocket.get_result(request_token)
  end
end
