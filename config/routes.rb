Rails.application.routes.draw do
  get 'news/create'
  get 'news/show'
  get 'news/index'
  get 'user_ratings/create'
  get 'user_ratings/show'
  get 'user_ratings/index'
  get 'tricks/create'
  get 'tricks/show'
  get 'tricks/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/update'
  # get 'users/destroy'
  # get 'users/index'
  # get 'users/show'
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/test", to: "api/test#test"
  
  get 'omniauth/vkontakte/callback', to: 'omniauth#create'

  namespace :api do
    post 'profile/upload_avatar', action: :upload_avatar, controller: 'profile'
    post 'user/:id/add_score', action: :user_score, controller: 'user_ratings'
    post 'news/create_new', action: :create, controller: 'news'
    get 'news', action: :show, controller: 'news'
    get 'news/:id', action: :index, controller: 'news'
    get 'user/score', action: :index, controller: 'user_ratings'
    post 'profile/delete_avatar', action: :delete_avatar, controller: 'profile'
    post 'tricks/create_new', action: :create, controller: 'tricks'
    get 'tricks', action: :index, controller: 'tricks'
    get 'tricks/:slug', action: :show, controller: 'tricks'
    put 'profile/update', action: :update, controller: 'profile'
    get 'profile', action: :show, controller: 'profile'
    get 'users', action: :index, controller: 'users'
    get 'user/:nickname', action: :show, controller: 'users'
    get 'spots', action: :index, controller: 'spots'
    get 'spot/:id', action: :show, controller: 'spots'
    post 'spots/register_new', action: :create, controller: 'spots'
    post 'spot/:id/like', action: :like, controller: 'spot_ratings'
    post 'spot/:id/unlike', action: :unlike, controller: 'spot_ratings'
    # namespace :user do
    #   get "/users", to: "api/users_controller#index"
    #   # get '/users', action: :index, controller: 'users'
    #   get '/user/:id', action: :show, controller: 'users'
    # end
    # namespace :profile do
      # post "/upload_avatar", to: "api/profile_controller#upload_avatar"
    # end
  end
end
