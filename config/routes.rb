Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/show'
  get 'recipes/create'
  get 'recipes/update'
  get 'recipes/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
