Rails.application.routes.draw do
  resources :posts
  resources :topics
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'static#home'
end
