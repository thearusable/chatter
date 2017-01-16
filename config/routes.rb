Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  root 'users#index'

  resources :rooms
  resources :conversations

  get "autocomplete" => "search#autocomplete"

  mount ActionCable.server => '/cable'

end
