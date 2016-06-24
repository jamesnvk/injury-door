Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }, 
              path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  root 'site#index'
  resources :posts, path: 'injuries' do
    resources :comments, only: [:create]
  end

  post '/injuries/:id', to: 'posts#show'
  

  resources :categories
end

          