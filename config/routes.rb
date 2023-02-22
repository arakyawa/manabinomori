Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show]
  get 'hello/index' => 'hello#index'
  root 'hello#index'
  resources :keys
  resources :calculations
  resources :quizzes
  resources :nazos
  resources :nakamas
  resources :roads
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
