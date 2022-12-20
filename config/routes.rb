Rails.application.routes.draw do
  root "users#index"
  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end
end
