class RecipeFood < ApplicationRecord
  belongs_to :recipe_id
  belongs_to :food_id
end
