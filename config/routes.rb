Rails.application.routes.draw do
  root 'contacts#index'
  resources :messages

  resources :incoming_messages

  resources :users

  resources :contacts do
    resources :messages
  end

  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
