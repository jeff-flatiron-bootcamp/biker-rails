Rails.application.routes.draw do
  resources :trips
  resources :bikes
  resources :manufacturers
  resources :bikers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
