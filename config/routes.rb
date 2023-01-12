Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get "users/profile"
  # Defines the root path route ("/")
root "users#profile"

post "users/upload_profile"
post "users/upload_cover"

end
