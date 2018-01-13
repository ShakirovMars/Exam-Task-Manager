Rails.application.routes.draw do
  resources :comments
  resources :tasks
  resources :projects
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
