Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users do
    resources :foods
    get '/public_recipes', to: 'recipes#public_recipes'
    resources :recipes do
      resources :recipe_foods
    end
  end
end
