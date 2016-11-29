Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end
  resources :chat_rooms, only: [:new, :create, :show, :index]
  #resource :users, :only => [:show]

  #root 'chat_rooms#index'
  root 'wellcome#index'

  mount ActionCable.server => '/cable'

  resources :chat_rooms do
    resources :messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
