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
    redirect_to root_path
  end

  def clean_pocket
    @person.clean_pocket
    redirect_to root_path
  end

  private

  def person_params
    params.require(:person).permit(:action, :frequency, :criteria)
  end
end
