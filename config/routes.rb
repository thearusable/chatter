Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  #get '/users/update' => 'registrations#update_profile'

  #devise_scope :user do
  #  get 'fill_profile', to: 'registrations#fill_profile'
  #  put 'fill_profile', to: 'registrations#fill_profile'
  #end
  resource :users

  resources :public_rooms, :controller => "rooms", :type => "PublicRoom", :type_path => "public"
  resources :private_rooms, :controller => "rooms", :type => "PrivateRoom", :type_path => "private"

  #update profile
  #devise_scope :user do
  #  get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
  #  get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  #end
  #resource :users, :only => [:update_profile]
  #get '/users/update' => "users#update"
  #match 'update_profile' => redirect("users#update")

  root 'users#index'
  #root 'wellcome#index'

  mount ActionCable.server => '/cable'

  resources :chat_rooms do
    resources :messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
