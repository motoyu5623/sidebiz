Rails.application.routes.draw do
  get 'stocks/create'
  get 'stocks/destroy'
  # get 'skills/create'
  # get 'main_job/new'
  # post 'main_job/create'
  # get 'main_job/edit'
  # resource :main_job, only: %i[new create edit update]
  get 'staticpage/index'
  root 'staticpage#index'

  resources :main_jobs, only: %i[new create edit update]
  resources :side_jobs, shallow: true do
    resources :skills, only: %i[new create]
    resource :stocks, only: %i[create destroy]
    get :stocks, on: :collection
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
