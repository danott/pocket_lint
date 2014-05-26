module Authentication
  extend ActiveSupport::Concern

  included do
    before_filter :load_person
  end

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
    if authenticated?
      @person = Person.find(session[:person_id])
    else
      @person = Person.null
    end
  end
end
