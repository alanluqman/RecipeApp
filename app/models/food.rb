class Food < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :recipe_food, class_name: 'RecipeFood', foreign_key: 'recipe_id'
end
