Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions, only: %i[create destroy]
 
  
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
  root to: 'sessions#home'
end

