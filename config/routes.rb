Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "homes#index"
  devise_for :users
  resources :users, only: %i[index show]

  resource :children

  resource :mypage, only: %i[show edit update], controller: "mypage"
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resources :comments
  end

  resources :events do
    resource :event_entries, only: [:create, :destroy]
    resources :event_comments
  end

  resources :dm_rooms, only: %i[show index]

  resources :movies, only: [:index]
end
