class PeopleController < ApplicationController
  include Authentication

  def show
    if authenticated?
      render :authenticated
    else
      render :unauthenticated
    end
  end

  def update
    @person.update_attributes(person_params)
    # @person.clean
  end

  private

  def person_params
    params.require(:person).permit(:action, :frequency, :criteria)
  end
end
