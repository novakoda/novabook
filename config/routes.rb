Rails.application.routes.draw do
  get 'user/:id', to: 'user#show', as: 'user'
  get 'users', to: 'user#index', as: 'user_index'
  resources :posts
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {
        registrations: 'users/registrations'
      }

  root 'posts#index', as: 'home'

  post 'users', to: 'devise/registrations#create', as: 'new_user'

end
