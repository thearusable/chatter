Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "application#index"

  resources :conversations do
    resources :messages
  end

  mount ActionCable.server => '/cable'

end
