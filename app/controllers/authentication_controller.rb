class AuthenticationController < ApplicationController
  helper_method :request_token, :access_token

  rescue_from AccessToken::TokenUnobtainable, with: :sign_out

  def authorize
    if authorized?
      redirect_to authorized_path
    else
      redirect_to(new_request_token.continue_authorization_url)
    end
  end

  def authorized
    new_access_token unless authorized?
  end

  def sign_out
    session.delete(:access_token)
    redirect_to root_path
  end

  private

  def authorized?
    access_token.present?
  end

  def new_request_token
    session[:request_token] = RequestToken.new
  end

  def new_access_token
    session[:access_token] = AccessToken.new(session.delete(:request_token))
  end

  def request_token
    session[:request_token]
  end

  def access_token
    session[:access_token]
  end
end
