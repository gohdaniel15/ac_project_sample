Rails.application.routes.draw do

  root to: 'pages#home'

  get 'home', to: 'pages#home'

  devise_for :users

end
