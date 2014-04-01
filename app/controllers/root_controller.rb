class RootController < ApplicationController
  def index
    render :unauthenticated unless authenticated?
  end
end
