Rails.application.routes.draw do
  get 'homes/top'
  devise_for :customers
  root to: "homes#top"
  resources :sessions, only: [:new, :destroy, :create]
  resources :customers, only: [:show, :edit, :update, :create, :destroy]
  resources :schedules, only: [:new,:show, :destroy, :create, :update, :index, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
