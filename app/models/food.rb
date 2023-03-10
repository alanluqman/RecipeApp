class Food < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id'
  has_many :recipes, through: :recipe_foods
  validates :name, :price, presence: { strict: true }
end
