Rails.application.routes.draw do
  get 'testpage/index'
  root 'testpage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
