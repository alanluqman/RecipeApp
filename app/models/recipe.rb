class Recipe < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id'
  validates :preparation_time, :cooking_time, :name, presence: { strict: true }
end
