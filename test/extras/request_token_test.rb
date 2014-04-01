require 'test_helper'

class RequestTokenTest < MiniTest::Unit::TestCase
  def test_request_token
    request_token = RequestToken.new
    assert_match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{6}$/, request_token
  end

  def test_continue_authorization_url
    request_token = RequestToken.new
    assert_match %r[^https://getpocket\.com/auth/authorize\?request_token=#{request_token}&redirect_uri=.*$], request_token.continue_authorization_url
  end
end
