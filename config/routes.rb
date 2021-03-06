Rails.application.routes.draw do
  get 'users/:id/followers', to: 'users#followers'
  get 'users/:id/followees', to: 'users#followees'
  delete 'follows/delete', to: 'follows#destroy'
  
  resources :users
  resources :follows
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
