class AuthenticationsController < ApplicationController
  before_filter :redirect_to_root, if: :authenticated?, except: [:destroy]

  def new
    redirect_to(new_request_token.continue_authorization_url)
  end

  def create
    authenticate(person_from_access_token)
    redirect_to root_path
  end

  def destroy
    deauthenticate
    redirect_to root_path
  end

  private

  def redirect_to_root
    redirect_to root_path
    return false
  end

  def person_from_access_token
    access_token = AccessToken.new(use_request_token)
    Person.find_or_initialize_by(access_token: access_token.to_s).tap do |person|
      person.username = access_token.username
      person.save
    end
  end

  def new_request_token
    session[:request_token] = RequestToken.new
  end

  def use_request_token
    session.delete(:request_token)
  end
end
