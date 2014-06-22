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
    if @person.update_attributes(person_params)
      @person.clean
    end
  end

  private

  def person_params
    params.require(:person).permit(:action, :considered_lint_s)
  end
end
