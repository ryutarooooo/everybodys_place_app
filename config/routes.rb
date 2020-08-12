Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  root "homes#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }
  resources :users, only: %i[index show]

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

  resources :demands, only: [:index]
end
