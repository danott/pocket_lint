require 'test_helper'

class RequestTokenTest < MiniTest::Unit::TestCase
  def setup
    VCR.insert_cassette "new_request_token"
  end

  def teardown
    VCR.eject_cassette
  end

  def test_request_token
    request_token = RequestToken.new
    assert_match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{6}$/, request_token
  end

  def test_continue_authorization_url
    request_token = RequestToken.new
    uri = URI.parse(request_token.continue_authorization_url)
    assert "getpocket.com" == uri.host
    assert_match "request_token=#{request_token}", uri.query
  end
end
