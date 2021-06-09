Rails.application.routes.draw do
  get 'users/index'
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
get '/member-data', to: 'members#show'
resources :accommodations
get'/users-list', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
