Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, except: [:show] do
    resources :foods, except: [:show]
    get '/public_recipes', to: 'recipes#public_recipes'
    resources :recipes do
      resources :recipe_foods
    end
  end
end
