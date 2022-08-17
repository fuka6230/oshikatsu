Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks", :registrations_controller => "users/registrations_controller" }
 
  
  resources :tags
  resources :tag_memos
  resources :plans do
    collection	do
      post :to_index, action: :to_index
    end
  end
  resources :memos do
    collection	do
      post :to_index, action: :to_index
    end
  end
  root to: 'plans#index'
end

