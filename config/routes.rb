Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/update'
  get 'recipe_foods/destroy'
  get 'foods/index'
  get 'foods/show'
  get 'foods/new'
  get 'foods/create'
  get 'foods/update'
  get 'foods/destroy'
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
