PocketLint::Application.routes.draw do
  resource :authentication, only: [:new, :destroy] do
    get 'update', as: :update
    get 'end', to: :destroy, as: :end
  end

  resource :person, only: [:show, :update]

  root 'people#show'
end
