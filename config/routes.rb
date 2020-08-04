Rails.application.routes.draw do
  get 'staticpage/index'
  root 'staticpage#index'

  resources :main_jobs, except: %i[index show]
  resources :side_jobs, shallow: true do
    resources :skills, only: %i[new create]
    resource :stocks, only: %i[create destroy]
    get :stocks, on: :collection
    resources :comments, only: [:create]
    # get 'change_form' to: 'side_jobs#change_form'
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
