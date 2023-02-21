Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/test", to: "api/test#test"
  
  namespace :api do
    # namespace :profile do
      # post "/upload_avatar", to: "api/profile_controller#upload_avatar"
    # end
    post 'profile/upload_avatar', action: :upload_avatar, controller: 'profile'
  end
end
