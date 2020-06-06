Rails.application.routes.draw do
  resources :posts
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root 'posts#index', as: 'home'
end
