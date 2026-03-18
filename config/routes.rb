Rails.application.routes.draw do
  get 'scores/index'
  devise_for :users
  resources :questions do
    resources :answers, only: [:create, :index]
  end

  resources :score, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/about', to: 'homes#about', as: 'about'
end
