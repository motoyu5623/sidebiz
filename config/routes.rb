Rails.application.routes.draw do
  get 'staticpage/index'
  root 'staticpage#index'
  resources :jobs
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
