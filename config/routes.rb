Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  get "/test", to: "api/test#test"
  
  get 'omniauth/vkontakte/callback', to: 'omniauth#create'

  namespace :api do
    post 'profile/upload_avatar', action: :upload_avatar, controller: 'profile'
    post 'user/:id/add_score', action: :user_score, controller: 'user_ratings'
    post 'news/create_new', action: :create, controller: 'news'
    get 'news', action: :show, controller: 'news'
    get 'news/:id', action: :index, controller: 'news'
    post 'spot/:id/post_comment', action: :create, controller: 'comments'
    delete 'spot/:id/delete_comment', action: :destroy, controller: 'comments'
    get 'user/score', action: :index, controller: 'user_ratings'
    get 'spots/top10', action: :top_10, controller: 'spots'
    get 'users/top10', action: :top_10, controller: 'users'
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
    # post 'api/v1/forgot_password' => "api/v1/passwords#forgot"
    # post 'api/v1/reset_password' => "api/v1/passwords#reset"
    
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
