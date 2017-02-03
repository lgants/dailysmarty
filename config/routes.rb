Rails.application.routes.draw do
  resources :topics, except: [:show] do
    # scope module: :topics do let's the application know that a custom scope will be set up inside of topics and look inside of this block
    scope module: :topics do
      # calls the normal resources method and returns the same available routes, but inside of the /topics route path
      # also need to nest the controllers to reflect this and update the classname of the Posts controller
      resources :posts, except: [:new, :create]
    end
  end

  get 'posts/new', to: 'topics/posts#new', as: 'new_post'
  post 'posts', to: 'topics/posts#create', as: 'create_post'

  root to: 'static#home'

  devise_for :users, controllers: { registrations: 'registrations' }
end
