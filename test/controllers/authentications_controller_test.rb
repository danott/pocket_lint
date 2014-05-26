require 'test_helper'

class AuthenticationsControllerTest < ActionController::TestCase
  def setup
    VCR.insert_cassette 'new_request_token'
  end

  def teardown
    VCR.eject_cassette
  end

  test "should redirect to Pocket for authorization" do
    get :new
    assert_response :redirect
    assert_match %r[^https://getpocket.com/], @response.redirect_url
    assert_match %r[request_token=[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{6}], @response.redirect_url
  end
end
