Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  #resource :users

  resources :rooms

  resources :conversations

  get "autocomplete" => "search#autocomplete"

  root 'users#index'

  mount ActionCable.server => '/cable'

end
