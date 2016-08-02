Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }, 
              path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  root 'site#index'
  resources :posts, path: 'injuries' do
    resources :comments, only: [:create, :index]
    resources :categories, only: [:create, :index, :new]
  end

  post '/injuries/:id', to: 'posts#show'
  

  resources :categories
end

          