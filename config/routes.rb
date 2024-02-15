Rails.application.routes.draw do
  get 'homes/top'
  devise_for :costomers
  root to: "homes#top"
  resources :sessions, only: [:new, :destroy, :create]
  resources :customers, only: [:show, :edit, :update]
  resources :schedules, only: [:new,:show, :destroy, :create, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
