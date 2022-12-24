require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    user = User.create(name: 'alan', email: 'alan@gmail.com', role: 'admin', password: 'password123')
    food = Food.create(name: 'orange', measurement_unit: 'grams', price: 3, author: user)
    recipe=Recipe.create(name: 'pizzah', preparation_time: 2, cooking_time: 2,
                  description: 'This is the description', public: true, author: user)
    RecipeFood.create(quantity: 4, recipe_id:recipe.id, food_id:food.id)
  end

  it '# is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
