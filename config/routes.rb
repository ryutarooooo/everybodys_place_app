Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  resources :users, only: %i[index show]
  resource :mypage, only: %i[show edit update], controller: "mypage"
  resource : tweets
end
