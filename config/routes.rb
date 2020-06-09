Rails.application.routes.draw do
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'user_index'

  resources :posts

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {
        registrations: 'users/registrations'
      }

  root 'posts#index', as: 'home'

  post 'users', to: 'devise/registrations#create', as: 'new_user'

  get 'users/:requestee_id/friend_request', to: 'users#friend_request', as: 'request'

end
