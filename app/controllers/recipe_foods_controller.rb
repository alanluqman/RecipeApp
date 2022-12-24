class RecipeFoodsController < ApplicationController
  def index; end

  def show; end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where(author: current_user)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    new_ingredient = @recipe.recipe_foods.new(params_data)

    if new_ingredient.save
      redirect_to user_recipe_path(user_id: current_user.id, id: @recipe.id)
    else
      p 'ingredient was not created'
    end
  end

  def edit
    @ingredient = RecipeFood.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:recipe_id])
    r_food = RecipeFood.find(params[:id])
    r_food.update(params_data)

    if r_food.save
      redirect_to user_recipe_path(user_id: current_user.id, id: recipe.id)
    else
      p 'Ingredient does not updated !'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    ingredient = RecipeFood.find(params[:id])
    if ingredient.destroy
      redirect_to user_recipe_path(user_id: current_user.id, id: @recipe.id)
    else
      p 'ingredient was not created'
    end
  end

  private

  def params_data
    params.permit(:food_id, :quantity)
  end
end
