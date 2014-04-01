PocketLint::Application.routes.draw do
  get 'authorize', to: 'authentication#authorize', as: :authorize
  get 'authorized', to: 'authentication#authorized', as: :authorized
  get 'sign-out', to: 'authentication#sign_out', as: :sign_out

  root "root#index"
end
