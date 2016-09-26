Rails.application.routes.draw do
  root 'messages#new'
  resources :messages

  resources :users

  resources :contacts

  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
