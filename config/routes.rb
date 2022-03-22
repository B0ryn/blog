Rails.application.routes.draw do
  root 'pages#home_page'
  get 'about', to: 'pages#about_page'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
end
