class PeopleController < ApplicationController
  def update
    @person.update_attributes(person_params)
    redirect_to root_path
  end

  def person_params
    params.require(:person).permit(:action, :frequency, :criteria)
  end
end
