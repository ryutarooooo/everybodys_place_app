Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  # resources :users, only: %i[] do
  #   resource :mypages, only: %i[]
  # end
end
