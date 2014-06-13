PocketLint::Application.routes.draw do
  resource :authentication, only: [:new, :destroy] do
    get 'update', as: :update
    get 'end', to: :destroy, as: :end
  end

  resource :person, only: [:update] do
    delete 'clean', as: :clean
  end

  root 'people#show'
end
