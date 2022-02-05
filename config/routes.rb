Rails.application.routes.draw do
  root 'pages#home_page'
  get 'about', to: 'pages#about_page'
  resources :articles, only: [:show, :index, :new, :create]
end
