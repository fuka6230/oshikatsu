Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks", :registrations_controller => "users/registrations_controller" }
  resources :plans
  resources :tags
  resources :memos
  resources :tag_memos
  root to: 'plans#index'
end

