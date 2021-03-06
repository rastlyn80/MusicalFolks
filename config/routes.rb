Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, 
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show] do
    member do
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'
    end
  end
  resources :venues, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
  resources :photos, only: [:create, :destroy]
  resources :reservations, only: [:create]
  end

  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]
  
  get '/your_rehearsals' => 'reservations#your_rehearsals'  
  get '/your_reservations' => 'reservations#your_reservations'  

  get 'search' => 'pages#search'

  get 'dashboard' => 'dashboard#index'

end
