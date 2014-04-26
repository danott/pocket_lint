PocketLint::Application.routes.draw do
  resource :authentication, only: [:new, :destroy] do
    get "create", to: :create, as: :create
  end
  resource :person, only: [:update]

  root "people#show"
end
