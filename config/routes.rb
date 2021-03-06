Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'tables#index'

  resources :tables do
    resource :invitations
    resources :messages
    resources :die_rolls
  end

  resources :players, only: [:show] do
    resources :saved_rolls
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
