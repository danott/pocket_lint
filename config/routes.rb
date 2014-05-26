PocketLint::Application.routes.draw do
  resource :authentication, only: [:new, :destroy] do
    get "create", to: :create, as: :create
  end

  resource :person, only: [:update] do
    delete "clean_pocket", to: :clean_pocket, as: :clean_pocket
  end

  root "people#show"
end
