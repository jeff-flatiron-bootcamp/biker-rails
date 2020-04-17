Rails.application.routes.draw do
  resources :trips
  resources :bikes
  resources :manufacturers
  resources :bikers

  get "/signup", to: "bikers#new", as: "signup"
  get "/login", to: "login#new", as: "login_path"
  post "/login", to: "login#verify"
  get "/logout", to: "login#logout", as: "logout_path"
  get "/bikes/:id/images/:id", to: "bikes#images", as: "bikes_image"
  delete 'bikes/:id/images/:id', to: "bikes#destroyImage", as: "bikes_image_destroy"

  root to: "login#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
