Rails.application.routes.draw do
  resources :posts

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {
    registrations: 'users/registrations'
  }

  root 'posts#index', as: 'home'

  post 'users', to: 'devise/registrations#create', as: 'new_user'

  post 'posts/:id/like', to: 'posts#like', as: 'like'
  delete 'posts/:id/unlike', to: 'posts#unlike', as: 'unlike'

  get 'notifications', to: 'users#notifications', as: 'notification'
  get 'friendship/:friendship_id', to: 'users#befriend', as: 'friendship'

  get 'users/:requestee_id/friend_request', to: 'users#friend_request', as: 'request'

  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'user_index'

end
