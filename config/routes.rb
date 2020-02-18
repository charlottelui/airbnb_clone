Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :bookings, only: [:create]
  end

  delete '/items/:id/photo/:photo_id', to: 'items#destroy_photo'

  get 'dashboard', to: 'dashboard#profile', as: :dashboard
end
