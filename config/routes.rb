Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, except: [:show] do
    resources :foods, except: [:show]
    get '/public_recipes', to: 'recipes#public_recipes'
    resources :recipes do
      get '/generate_shopping_list', to: 'recipes#shoping'
      patch '/make_public', to: 'recipes#make_public'
      patch '/make_private', to: 'recipes#make_private'
      resources :recipe_foods
    end
  end
end
