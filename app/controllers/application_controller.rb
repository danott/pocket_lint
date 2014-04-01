class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :authenticated?

  before_filter :load_person, if: :authenticated?

  private

  def authenticated?
    session[:person_id].present?
  end

  def authenticate(person)
    session[:person_id] = person.id
  end

  def deauthenticate
    session.delete(:person_id)
  end

  def load_person
    @person = Person.find(session[:person_id])
  end
end
